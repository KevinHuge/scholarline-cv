// expect: unknown plugin `footer`
#import "/lib.typ": cv
#show: cv.with(name: "X", plugins: (footer: none))
