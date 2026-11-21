#import "/lib.typ": contact, cv, cv-theme, section

#assert.eq(contact("A", "https://example.com"), (label: "A", url: "https://example.com", icon: none))

#show: cv.with(
  name: "Test",
  subtitle: "Sub",
  theme: (ink: rgb("#000000"), spacing: 1.2),
  contacts: (contact("A", "https://example.com", icon: "github"), contact("B", "https://example.com", icon: [→])),
)
#context assert.eq(cv-theme().ink, rgb("#000000"))
#context assert.eq(cv-theme().spacing, 1.2)
#section("Heading")[Body text.]
