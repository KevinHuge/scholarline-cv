// Every built-in part can be replaced, and custom components use the same primitives as built-ins.
#import "/lib.typ": *

#let star = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\"><path d=\"M12 3l2.6 5.9 6.4.6-4.8 4.3 1.4 6.3L12 16.8 6.4 20.1l1.4-6.3L3 9.5l6.4-.6z\"/></svg>"

#show: cv.with(
  name: "Plugins",
  contacts: (contact("Star", "https://example.com", icon: "star"),),
  plugins: (
    header: (name, subtitle, contacts) => [#metadata("header") <probe-header> #default-header(name, subtitle, contacts)],
    heading: title => [#metadata("heading") <probe-heading> #title],
    section: (title, body) => [#metadata("section") <probe-section> #default-section(title, body)],
    links: links => [#metadata("links") <probe-links> #default-links(links)],
    icons: (star: star),
  ),
)

#let talk(title: "", venue: none, date: none, links: ()) = entry(
  ([#entry-title(title)#entry-links(links)], entry-meta(venue)),
  aside: (date,),
)

#section("Talks")[#talk(title: "A Talk", venue: "Workshop", date: "2026", links: ((label: "slides", url: "https://example.com"),))]
#section("Icons")[#cv-icon("star") #cv-icon("github") #talk(title: "No links")]

#context assert.eq(query(<probe-header>).len(), 1)
#context assert.eq(query(<probe-section>).len(), 2)
#context assert.eq(query(<probe-heading>).len(), 2)
// Entries without links never call the links plugin.
#context assert.eq(query(<probe-links>).len(), 1)
