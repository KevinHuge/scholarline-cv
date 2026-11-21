// Scholarline CV — customizable academic CV layout, MIT licensed.
#let contact(label, url, icon: none) = (label: label, url: url, icon: icon)
#let cv-link(label, url) = link(url)[#label]

#let icon-content(spec) = {
  if spec == none { [] }
  else if type(spec) != str { spec }
  else if spec == "scholar" { image("assets/icons/scholar.svg", height: 9pt) }
  else if spec == "github" { image("assets/icons/github.svg", height: 9pt) }
  else if spec == "web" { image("assets/icons/web.svg", height: 9pt) }
  else if spec == "email" { image("assets/icons/email.svg", height: 9pt) }
  else if spec == "linkedin" { image("assets/icons/linkedin.svg", height: 9pt) }
  else if spec == "orcid" { image("assets/icons/orcid.svg", height: 9pt) }
  else if spec == "phone" { image("assets/icons/phone.svg", height: 9pt) }
  else if spec == "location" { image("assets/icons/location.svg", height: 9pt) }
  else if spec == "link" { image("assets/icons/link.svg", height: 9pt) }
  else { text(size: 8pt)[#spec] }
}

#let contact-item(item) = {
  let label = item.at("label", default: "")
  let url = item.at("url", default: "")
  let icon = item.at("icon", default: none)
  box[
    #if icon != none [
      #box(baseline: -1pt)[#icon-content(icon)]
      #h(0.28em)
    ]
    #link(url)[#label]
  ]
}

#let cv-header(name, subtitle: none, contacts: (), alignment: center) = {
  block(above: 0pt, below: 3pt)[
    #align(alignment)[
      #text(size: 24pt, weight: "bold", fill: rgb("#172338"))[#name]
      #if subtitle != none [
        #v(1.5pt)
        #text(size: 9.2pt, fill: rgb("#516173"))[#subtitle]
      ]
      #if contacts.len() > 0 [
        #v(5pt)
        #text(size: 8.7pt)[
          #for (i, item) in contacts.enumerate() {
            if i > 0 { h(0.82em) }
            contact-item(item)
          }
        ]
      ]
    ]
  ]
}

#let cv(
  name: "Your Name",
  subtitle: none,
  contacts: (),
  accent: rgb("#26428b"),
  font: "New Computer Modern",
  font-size: 9.4pt,
  paper: "us-letter",
  margin: (top: 0.55in, bottom: 0.55in, left: 0.68in, right: 0.68in),
  header-align: center,
  body,
) = {
  set page(paper: paper, margin: margin)
  set text(font: font, size: font-size, fill: rgb("#203047"))
  set par(leading: 0.31em, spacing: 0.24em)
  set list(indent: 1em, body-indent: 0.37em, spacing: 0.16em)
  show link: set text(fill: accent)
  show heading.where(level: 2): it => block(sticky: true, above: 8pt, below: 4pt)[
    #text(size: 10.5pt, weight: "bold", fill: accent)[#it.body]
    #v(1.6pt)
    #line(length: 100%, stroke: (paint: accent, thickness: 0.65pt))
  ]
  [
    #cv-header(name, subtitle: subtitle, contacts: contacts, alignment: header-align)
    #block(above: 2pt, below: 0pt)[
      #line(length: 100%, stroke: (paint: rgb("#d5dce5"), thickness: 0.5pt))
    ]
    #body
  ]
}

#let section(title, body) = [
  #heading(title, level: 2, outlined: false)
  #body
]

#let education(institution: "", degree: "", dates: "", location: none, body: none) = {
  block(above: 2pt, below: 5pt)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 8pt,
      [#strong(institution)],
      [#text(size: 8.6pt, fill: rgb("#536277"))[#dates]],
    )
    #grid(
      columns: (1fr, auto),
      column-gutter: 8pt,
      [#degree],
      [#if location != none { text(size: 8.6pt, fill: rgb("#536277"))[#location] }],
    )
    #if body != none [#v(1pt) #body]
  ]
}

#let experience(institution: "", role: "", dates: "", location: none, advisor: none, body: none) = {
  block(above: 2pt, below: 6pt)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 8pt,
      [#strong(institution)],
      [#text(size: 8.6pt, fill: rgb("#536277"))[#dates]],
    )
    #grid(
      columns: (1fr, auto),
      column-gutter: 8pt,
      [#emph(role)],
      [#if location != none { text(size: 8.6pt, fill: rgb("#536277"))[#location] }],
    )
    #if advisor != none [
      #text(size: 8.65pt, fill: rgb("#536277"))[Advisor: #advisor]
    ]
    #if body != none [#v(1pt) #body]
  ]
}

#let publication(title: "", authors: [], links: (), note: none) = {
  block(above: 2pt, below: 5pt)[
    #text(weight: "semibold")[#title]
    #for item in links [
      #h(0.48em)
      #text(size: 8.2pt)[\[#link(item.url)[#item.label]\]]
    ]
    #v(1pt)
    #text(size: 8.9pt)[#authors]
    #if note != none [
      #v(1pt)
      #text(size: 8.3pt, fill: rgb("#536277"))[#note]
    ]
  ]
}

#let award(name: "", date: "") = {
  block(above: 1pt, below: 2pt)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 8pt,
      [#name],
      [#text(size: 8.6pt, fill: rgb("#536277"))[#date]],
    )
  ]
}

#let skill-line(label: "", items: []) = block(above: 0pt, below: 1pt)[
  #strong(label): #items
]
