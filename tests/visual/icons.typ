// Visual check: icons must sit on the text centre line at every size and script.
// typst compile --root . --font-path fonts tests/visual/icons.typ /tmp/icons.png --ppi 300
#import "/lib.typ": builtin-icons, cv, cv-icon
#show: cv.with(name: "Icon alignment", theme: (paper: "a5"))
#for size in (8pt, 9.6pt, 12pt) {
  set text(size: size)
  block[
    #for name in builtin-icons.keys() [
      #box(stroke: (bottom: 0.2pt + red))[#cv-icon(name)#h(0.35em)Hg#name] #h(0.8em)
    ]
    #cv-icon("github")#h(0.35em)主页 GitHub
  ]
}
