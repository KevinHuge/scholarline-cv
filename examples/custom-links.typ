// Everything is a plugin: theme overrides, the margin-grid section and underlined-link presets,
// a custom icon, and a custom component.
#import "../lib.typ": *

// A plugin icon is just an SVG string that uses stroke="currentColor".
#let book = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H20v20H6.5a2.5 2.5 0 0 1 0-5H20\"/></svg>"

#show: cv.with(
  name: "Your Name",
  subtitle: "Independent researcher",
  theme: (paper: "a4", muted: rgb("#7a7a7a"), spacing: 1.15, header-align: left),
  plugins: (
    section: margin-section, // section labels in a left column (built-in alternative)
    links: underline-links,  // underlined entry links instead of `label ↗` (built-in alternative)
    icons: (book: book),
  ),
  contacts: (
    contact("Scholar profile", "https://scholar.google.com", icon: "scholar"),
    contact("ORCID", "https://orcid.org", icon: "orcid"),
    contact("Publications", "https://example.com/publications", icon: "book"),
    contact("Notes", "https://example.com/notes", icon: text(fill: rgb("#7a7a7a"))[→]),
    contact("CV as HTML", "https://example.com/cv"),
  ),
)

// A custom component written with the same primitives as the built-in ones.
#let talk(title: "", event: none, place: none, date: none, links: ()) = entry(
  ([#entry-title(title)#entry-links(links)], entry-meta(dot-join((event, place)))),
  aside: (date,),
)

#section("About")[
  Contact labels, icons, order, and targets are independent. Built-in and plugin icons follow the theme's `muted` colour.
]

#section("Invited Talks")[
  #talk(
    title: "Planning Under Uncertainty for Research Agents",
    event: "Example Workshop on Agents",
    place: "Online",
    date: "2026",
    links: ((label: "slides", url: "https://example.com/slides"),),
  )
]
