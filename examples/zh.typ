// 中文简历示例：全部为匿名占位信息。
#import "../lib.typ": *

#show: cv.with(
  name: "你的名字",
  subtitle: "计算机科学 · 示例大学",
  lang: "zh",
  contacts: (
    contact("谷歌学术", "https://scholar.google.com", icon: "scholar"),
    contact("GitHub", "https://github.com", icon: "github"),
    contact("个人主页", "https://example.com", icon: "web"),
    contact("邮箱", "mailto:you@example.com", icon: "email"),
  ),
)

#section("教育经历")[
  #education(
    institution: "示例大学",
    degree: "计算机科学与技术 · 理学学士",
    dates: "2023 – 2027",
    location: "某城市",
    details: "GPA：3.90/4.00 · 专业前 5%",
    body: [- 主修课程：机器学习、算法设计与分析、计算机视觉],
  )
]

#section("科研经历")[
  #experience(
    institution: "智能系统实验室",
    role: "科研实习生",
    advisor: "导师：示例教授",
    dates: "2026.05 – 至今",
    body: [
      - 设计并实现面向多模态智能体的模块化评测框架。
      - 系统分析不同任务上的效率与准确率权衡。
    ],
  )
]

#section("荣誉奖项")[
  #award(name: "本科生科研奖学金", date: "2026")
  #award(name: "校级一等奖学金", date: "2025")
]

#section("技能")[
  #skill-line(label: "编程语言", items: [Python、Java、C++])
  #skill-line(label: "语言", items: [中文（母语）、英语（流利）])
]
