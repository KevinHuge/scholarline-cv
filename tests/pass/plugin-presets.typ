// The built-in alternative plugins: margin-grid sections and underlined entry links.
#import "/lib.typ": *

#show: cv.with(name: "Presets", plugins: (section: margin-section, links: underline-links))
#section("Education")[#education(institution: "U", dates: "2020")]
#section("Publications")[#publication(title: "P", links: ((label: "paper", url: "https://example.com"),))]
#section("Skills")[#skill-line(label: "Programming", items: [Python])]

// Margin sections keep real headings, so PDF bookmarks and the document outline still work.
#context assert.eq(query(heading.where(level: 2)).len(), 3)
