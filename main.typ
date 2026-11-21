// Anonymous sample CV. Replace every placeholder with your own information.
#import "lib.typ": *

#let contacts = (
  contact("Google Scholar", "https://scholar.google.com", icon: "scholar"),
  contact("GitHub", "https://github.com", icon: "github"),
  contact("Homepage", "https://example.com", icon: "web"),
  contact("Email", "mailto:you@example.com", icon: "email"),
)

#show: cv.with(
  name: "Your Name",
  subtitle: "Computer Science · University Name",
  contacts: contacts,
)

#section("Education")[
  #education(
    institution: "University Name",
    degree: "B.S. in Computer Science",
    dates: "2023–2027",
    location: "City, Country",
    body: [- *Relevant courses:* Machine Learning, Algorithms, Linear Algebra],
  )
]

#section("Publications")[
  #publication(
    title: "A Research Paper Title",
    authors: [Your Name, Coauthor One, Coauthor Two.],
    links: (
      (label: "Paper", url: "https://example.com/paper"),
      (label: "Code", url: "https://github.com"),
    ),
  )
]

#section("Research Experience")[
  #experience(
    institution: "Research Lab / University",
    role: "Research Intern",
    dates: "2025–Present",
    advisor: [Professor Name],
    body: [
      - Describe a problem you addressed and your contribution.
      - Show evidence of impact, outcomes, or evaluation.
    ],
  )
]

#section("Awards")[
  #award(name: "Award Name", date: "2025")
]

#section("Skills")[
  #skill-line(label: "Programming", items: [Python, Java])
  #skill-line(label: "Tools", items: [PyTorch, Git, Linux])
]
