#import "/lib.typ": builtin-icons, cv, cv-icon

#assert.eq(builtin-icons.keys().sorted(), ("email", "github", "link", "linkedin", "location", "orcid", "phone", "scholar", "web"))
#for (name, svg) in builtin-icons {
  assert(svg.contains("stroke=\"currentColor\""), message: name + ".svg must use currentColor")
  assert(not svg.contains("#"), message: name + ".svg must not hard-code colours")
}

#show: cv.with(name: "Icons")
// Every built-in icon must decode as SVG after tinting; none and content pass through.
#for name in builtin-icons.keys() [#cv-icon(name) ]
#cv-icon(none) #cv-icon([→])
