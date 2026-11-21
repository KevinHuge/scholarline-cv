// expect: unknown icon `twitter`
#import "/lib.typ": contact, cv
#show: cv.with(name: "X", contacts: (contact("T", "https://example.com", icon: "twitter"),))
