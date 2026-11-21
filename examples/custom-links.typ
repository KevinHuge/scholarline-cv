// Demonstrates arbitrary link labels and Typst-content icons.
#import "../lib.typ": *

#show: cv.with(
  name: "Your Name",
  subtitle: "Independent researcher",
  contacts: (
    contact("Scholar profile", "https://scholar.google.com", icon: "scholar"),
    contact("Publications", "https://example.com/publications", icon: [✦]),
    contact("CV as HTML", "https://example.com/cv", icon: none),
    contact("Lab", "https://example.org", icon: "link"),
  ),
  accent: rgb("#385d77"),
)

#section("About")[
  Contact titles, icons, positions, and clickable targets are independent.
]
