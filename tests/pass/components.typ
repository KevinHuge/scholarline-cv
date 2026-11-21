#import "/lib.typ": *

#assert.eq(dot-join(([a], none, [b])), [a] + [ · ] + [b])
#assert.eq(dot-join((none, none)), none)

#show: cv.with(name: "Test", contacts: (contact("A", "https://example.com", icon: "github"),))
#section("All components, optional fields omitted")[
  #education(institution: "U")
  #experience(institution: "L")
  #publication(title: "P")
  #project(name: "X")
  #award(name: "A")
  #skill-line(label: "S", items: [x])
]
#section("All components, all fields")[
  #education(institution: "U", degree: "D", dates: "2020", location: "C", details: "GPA", body: [- b])
  #experience(institution: "L", role: "R", advisor: "Adv", dates: "2021", location: "C", body: [- b])
  #publication(title: "P", authors: [A, B], venue: "V", links: ((label: "paper", url: "https://example.com"),), note: "N")
  #project(name: "X", role: "R", tech: "T", dates: "2022", links: ((label: "link", url: "https://example.com"),), body: [- b])
]
