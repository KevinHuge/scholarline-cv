// expect: lang must be `en` or `zh`, got `fr`
#import "/lib.typ": cv
#show: cv.with(name: "X", lang: "fr")
