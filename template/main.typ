// Typst Universe sample, to be activated after publication.
#import "@preview/scholarline-cv:0.1.0": *

#let contacts = (
  contact("Google Scholar", "https://scholar.google.com", icon: "scholar"),
  contact("GitHub", "https://github.com", icon: "github"),
  contact("Homepage", "https://example.com", icon: "web"),
  contact("Email", "mailto:you@example.com", icon: "email"),
)

#show: cv.with(
  name: "Your Name",
  subtitle: "Your academic / professional headline",
  contacts: contacts,
)

#section("Education")[
  #education(
    institution: "University Name",
    degree: "B.S. in Computer Science",
    dates: "2023–2027",
    location: "City, Country",
  )
]

#section("Publications")[
  #publication(
    title: "Your Paper Title",
    authors: [Your Name, Coauthor One.],
    links: ((label: "Paper", url: "https://example.com/paper"),),
  )
]

#section("Research Experience")[
  #experience(
    institution: "Research Institution",
    role: "Research Intern",
    dates: "2025–Present",
    body: [- A concise achievement or contribution.],
  )
]

#section("Skills")[
  #skill-line(label: "Programming", items: [Python, Java])
]
