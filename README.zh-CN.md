# Scholarline CV

一个从零编写的开源 Typst 学术简历模板。适合研究生申请、博士申请、科研实习和学术 CV。

> v0.1.0 原型。所有公开示例均为匿名占位信息，尚未发布至 Typst Universe。

## 快速开始

安装 Typst 0.13 或更新版本后，在仓库根目录运行：

```sh
typst compile main.typ
typst compile --root . examples/custom-links.typ
```

当入口文件位于 `examples/` 等子目录、需要导入上一级的 `lib.typ` 时，请指定 `--root .`。

## 自定义姓名下方的链接

```typst
#import "lib.typ": *
#let contacts = (
  contact("Google Scholar", "https://scholar.google.com", icon: "scholar"),
  contact("GitHub", "https://github.com", icon: "github"),
  contact("Homepage", "https://example.com", icon: "web"),
  contact("Email", "mailto:you@example.com", icon: "email"),
)
#show: cv.with(name: "Your Name", contacts: contacts)
```

每条联系信息的显示名称、URL、图标、顺序互相独立，也可传入自定义 Typst 内容作为图标。

主要组件包括 `section`、`education`、`experience`、`publication`、`award` 和 `skill-line`。完整参数参见 [API 文档](docs/API.md)。

## 隐私

公开示例只包含虚构、占位信息，不含维护者的真实 CV 或个人联系方式；请勿在 Pull Request 中提交他人的私人履历。
