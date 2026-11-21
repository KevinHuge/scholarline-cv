#import "/lib.typ": cv, section, skill-line
#show: cv.with(name: "名字", lang: "zh")
#context assert.eq(text.lang, "zh")
#section("技能")[#skill-line(label: "语言", items: [中文])]
