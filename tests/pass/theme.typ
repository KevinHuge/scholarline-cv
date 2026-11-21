#import "/lib.typ": default-theme, resolve-theme

#let base = resolve-theme((:))
#assert.eq(base.ink, rgb("#151515"))
#assert.eq(base.muted, rgb("#666666"))
#assert.eq(base.rule, rgb("#E6E6E6"))
#assert.eq(base.margin, (x: 0.7in, y: 0.6in))
#assert("accent" not in default-theme)
#assert.eq(base.display-font, ("Inter Display",))

#let custom = resolve-theme((ink: rgb("#000000"), paper: "a4"))
#assert.eq(custom.ink, rgb("#000000"))
#assert.eq(custom.muted, default-theme.muted)
#assert.eq(custom.margin, (x: 18mm, y: 15mm))

#let explicit = resolve-theme((margin: 1in))
#assert.eq(explicit.margin, 1in)
