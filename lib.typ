// Scholarline CV — a minimal, customizable academic CV template for Typst. MIT licensed.
//
// Everything is a plugin: the core `cv()` only sets up the page and stores the theme.
// The header, section headings, and icon table are replaceable plugins, and every
// built-in component is written with the same public primitives you can use yourself.
//
// Sections of this file: Theme · Icons · Primitives · Layout · Components.

// ── Theme ──────────────────────────────────────────────────────────────────────

#let default-theme = (
  ink: rgb("#151515"),
  muted: rgb("#666666"),
  rule: rgb("#E6E6E6"),
  font: ("Inter", "Helvetica Neue", "Helvetica", "Arial"),
  cjk-font: ("Noto Sans SC", "Noto Sans CJK SC", "Source Han Sans SC", "PingFang SC", "Microsoft YaHei"),
  size: 9.6pt,
  spacing: 1.0,
  paper: "us-letter",
  margin: auto,
  header-align: center,
)

#let resolve-theme(user) = {
  for key in user.keys() {
    if key not in default-theme {
      panic("scholarline-cv: unknown theme key `" + key + "`; valid keys: " + default-theme.keys().join(", "))
    }
  }
  let t = default-theme + user
  if t.margin == auto {
    t.margin = if t.paper == "a4" { (x: 18mm, y: 15mm) } else { (x: 0.7in, y: 0.6in) }
  }
  t
}

// ── Icons ──────────────────────────────────────────────────────────────────────

// SVG sources use stroke="currentColor"; it is replaced by the theme's `muted` colour.
#let builtin-icons = (
  scholar: read("assets/icons/scholar.svg"),
  github: read("assets/icons/github.svg"),
  web: read("assets/icons/web.svg"),
  email: read("assets/icons/email.svg"),
  linkedin: read("assets/icons/linkedin.svg"),
  orcid: read("assets/icons/orcid.svg"),
  phone: read("assets/icons/phone.svg"),
  location: read("assets/icons/location.svg"),
  link: read("assets/icons/link.svg"),
)

// Icons are 0.95em tall and shifted down by (0.95em − 0.72em) / 2, which puts their
// centre on the midline of Inter's cap height so they sit centred on the text line.
#let icon-height = 0.95em
#let icon-shift = 0.115em

// ── Primitives ─────────────────────────────────────────────────────────────────

#let cv-state = state("scholarline-cv", (theme: resolve-theme((:)), icons: builtin-icons))

/// The resolved theme dictionary. Call inside `context`.
#let cv-theme() = cv-state.get().theme

/// A built-in or plugin icon by name, tinted and centred; other content is returned as-is.
#let cv-icon(spec) = {
  if spec == none or type(spec) != str { return spec }
  context {
    let icons = cv-state.get().icons
    if spec not in icons {
      panic("scholarline-cv: unknown icon `" + spec + "`; available icons: " + icons.keys().join(", "))
    }
    let svg = icons.at(spec).replace("currentColor", cv-theme().muted.to-hex())
    box(baseline: icon-shift, image(bytes(svg), format: "svg", height: icon-height))
  }
}

/// Semibold entry title.
#let entry-title(body) = context text(size: cv-theme().size * 1.04, weight: "semibold", body)

/// Muted metadata text (dates, roles, authors). `none` stays `none`.
#let entry-meta(body) = if body != none {
  context text(size: cv-theme().size * 0.94, fill: cv-theme().muted, body)
}

/// Joins the non-`none` parts with " · "; returns `none` when nothing is left.
#let dot-join(parts) = parts.filter(p => p != none).join[ · ]

/// Muted `[label]` links from an array of `(label:, url:)` dictionaries.
#let bracket-links(links) = for item in links {
  h(0.4em)
  link(item.url, entry-meta[\[#item.label\]])
}

/// The shared two-column entry: `lines` on the left, muted `aside` rows on the right,
/// then an optional `body`. `none` rows are dropped without leaving a gap.
#let entry(lines, aside: (), body: none) = context {
  let s = cv-theme().spacing
  let lines = lines.filter(x => x != none)
  let aside = aside.filter(x => x != none).map(entry-meta)
  let cells = ()
  for i in range(calc.max(lines.len(), aside.len())) {
    cells.push(lines.at(i, default: []))
    cells.push(aside.at(i, default: []))
  }
  block(above: 10pt * s, below: 10pt * s, width: 100%, {
    grid(
      columns: (1fr, auto),
      column-gutter: 12pt,
      row-gutter: 4pt * s,
      align: (start + horizon, end + horizon),
      ..cells,
    )
    if body != none { body }
  })
}

// ── Layout ─────────────────────────────────────────────────────────────────────

#let contact(label, url, icon: none) = (label: label, url: url, icon: icon)

#let contact-item(item) = context box({
  let icon = item.at("icon", default: none)
  if icon != none {
    cv-icon(icon)
    h(0.35em)
  }
  link(item.url, underline(stroke: 0.5pt + cv-theme().ink, offset: 2.5pt, item.label))
})

/// Default header plugin: centred name, muted subtitle, and a `·`-separated contact row.
#let default-header(name, subtitle, contacts) = context {
  let t = cv-theme()
  let s = t.spacing
  let rows = (text(size: t.size * 2.3, weight: "bold", name),)
  if subtitle != none {
    rows += (6pt * s, text(fill: t.muted, subtitle))
  }
  if contacts.len() > 0 {
    let sep = h(0.6em) + text(fill: t.muted)[·] + h(0.6em)
    rows += (10pt * s, contacts.map(contact-item).join(sep))
  }
  block(width: 100%, above: 0pt, below: 0pt, {
    set align(t.header-align)
    stack(dir: ttb, ..rows, 16pt * s, line(length: 100%, stroke: 0.5pt + t.rule))
  })
}

/// Default section-heading plugin: title over a full-width hairline.
#let default-heading(title) = context {
  let t = cv-theme()
  let s = t.spacing
  block(sticky: true, above: 18pt * s, below: 10pt * s, width: 100%, stack(
    dir: ttb,
    spacing: 6pt * s,
    text(size: t.size * 1.2, weight: "semibold", title),
    line(length: 100%, stroke: 0.5pt + t.rule),
  ))
}

#let default-plugins = (header: auto, heading: auto, icons: (:))

#let cv(
  name: "Your Name",
  subtitle: none,
  contacts: (),
  lang: "en",
  theme: (:),
  plugins: (:),
  body,
) = {
  if lang not in ("en", "zh") {
    panic("scholarline-cv: lang must be `en` or `zh`, got `" + str(lang) + "`")
  }
  for key in plugins.keys() {
    if key not in default-plugins {
      panic("scholarline-cv: unknown plugin `" + key + "`; valid plugins: " + default-plugins.keys().join(", "))
    }
  }
  let t = resolve-theme(theme)
  let p = default-plugins + plugins
  let header = if p.header == auto { default-header } else { p.header }
  let heading-fn = if p.heading == auto { default-heading } else { p.heading }
  let s = t.spacing

  set page(paper: t.paper, margin: t.margin)
  set text(
    font: t.font + t.cjk-font,
    size: t.size,
    fill: t.ink,
    lang: lang,
    region: if lang == "zh" { "cn" } else { none },
    cjk-latin-spacing: auto,
  )
  set par(leading: if lang == "zh" { 0.8em } else { 0.7em }, spacing: 4pt * s)
  set block(spacing: 4pt * s)
  set list(marker: text(fill: t.muted)[•], indent: 0pt, body-indent: 0.45em, spacing: 4pt * s)
  show heading.where(level: 2): it => heading-fn(it.body)

  cv-state.update((theme: t, icons: builtin-icons + p.icons))
  header(name, subtitle, contacts)
  body
}

#let section(title, body) = {
  heading(level: 2, outlined: false, title)
  body
}

// ── Components ─────────────────────────────────────────────────────────────────
// Built-in components use only the public primitives above; write your own the same way.

#let education(institution: "", degree: none, dates: none, location: none, details: none, body: none) = entry(
  (entry-title(institution), degree, entry-meta(details)),
  aside: (dates, location),
  body: body,
)

#let experience(institution: "", role: none, advisor: none, dates: none, location: none, body: none) = entry(
  (entry-title(institution), entry-meta(dot-join((role, advisor)))),
  aside: (dates, location),
  body: body,
)

#let publication(title: "", authors: none, venue: none, links: (), note: none) = entry((
  [#entry-title(title)#bracket-links(links)],
  entry-meta(dot-join((authors, venue))),
  entry-meta(note),
))

#let project(name: "", role: none, tech: none, dates: none, links: (), body: none) = entry(
  ([#entry-title(name)#bracket-links(links)], entry-meta(dot-join((role, tech)))),
  aside: (dates,),
  body: body,
)

#let award(name: "", date: none) = entry((name,), aside: (date,))

#let skill-line(label: "", items: []) = context {
  let colon = if text.lang == "zh" { "：" } else { ": " }
  block(above: 6pt * cv-theme().spacing, below: 6pt * cv-theme().spacing)[
    #text(weight: "semibold")[#label#colon]#items
  ]
}
