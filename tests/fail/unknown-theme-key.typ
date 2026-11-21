// expect: unknown theme key `accent`
#import "/lib.typ": cv
#show: cv.with(name: "X", theme: (accent: red))
