// Layout rules from the rhythm pass: single-line rows share a tight gap, descriptions get
// extra air above them, and the name uses the display font.
#import "/lib.typ": *

#show: cv.with(name: "Rhythm")
#context assert.eq(cv-theme().display-font, ("Inter Display",))
#section("Awards")[
  #award(name: "A", date: "2026")
  #award(name: "B", date: "2025")
]
#section("Experience")[
  #experience(institution: "L", role: "R", dates: "2026", body: [- A description long enough to wrap onto the next line of the page.])
]
