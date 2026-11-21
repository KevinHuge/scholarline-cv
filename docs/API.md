# API — prototype v0.1.0

## `cv`

Use `#show: cv.with(...)` with `name`, optional `subtitle`, `contacts`, `accent`, `font`, `font-size`, `paper`, `margin`, and `header-align`.

```typst
#show: cv.with(
  name: "Your Name",
  subtitle: "Academic researcher",
  contacts: (contact("Google Scholar", "https://scholar.google.com", icon: "scholar"),),
  accent: rgb("#26428b"),
  font: "New Computer Modern",
  font-size: 9.4pt,
  paper: "us-letter",
  header-align: center,
)
```

## `contact(label, url, icon: none)`

Labels, URLs, icons, and order are independent. Built-in icon names: `scholar`, `github`, `web`, `email`, `linkedin`, `orcid`, `phone`, `location`, `link`. Other Typst content can be an icon, e.g. `icon: image("my-icon.svg", height: 9pt)`.

## Other helpers

- `section(title)[body]` — section heading
- `education(institution:, degree:, dates:, location:, body:)`
- `experience(institution:, role:, dates:, location:, advisor:, body:)`
- `publication(title:, authors:, links:, note:)` — links is an array of `(label:, url:)` dictionaries
- `award(name:, date:)`
- `skill-line(label:, items:)`

These components accept ordinary Typst content, including formatted authors and embedded clickable links.
