# Answer me with HTML 一键安装指南

> 第三方部署指南 · 非 Answer me with HTML 官方仓库。官方项目：[QingYunA/answer-me-with-html](https://github.com/QingYunA/answer-me-with-html)
> 内容来自官方文档（2026-10-29）。项目迭代快，请以[官方文档](https://github.com/QingYunA/answer-me-with-html/blob/main/INSTALL.md)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用再翻一屏终端文字，让 Agent 把难题写成一张能读、能离线保存的 HTML 页。

⚠️ 需要 Node.js 20+。技能通过 npx skills 写入对应 Agent 的技能目录，只支持具备技能机制的客户端（Claude Code、Codex、Cursor、OpenCode 等）。生成结果为单文件 HTML，默认离线可看；安装动作会改动 Agent 的技能目录。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/answer-me-with-html-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会检查 Node 20+，用 npx skills 把技能装进当前 Agent，并核对安装结果，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## Answer me with HTML 是什么？

Answer me with HTML 是开源的把 Agent 的复杂回答变成一张可读、可离线保存的 HTML 页面的 Agent 技能（协议：MIT，<img src="https://img.shields.io/github/stars/QingYunA/answer-me-with-html?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一个 Agent 技能：模型只写 Markdown 草稿，随技能附带的 CLI 负责生成 SVG 图、CSS 和 HTML，把复杂问题输出成可读的单页文档，官方给出的实测是模型输出 token 约为手写 HTML 的 1/8。

- 省 token：模型只写内容草稿，版式与图表由 CLI 生成
- 单文件：输出一个 HTML，离线也能打开和转发
- 图表自动：流程图、对比图由 CLI 画，不靠模型拼坐标
- 多客户端：Claude Code、Codex、Cursor、OpenCode、Pi、DeepSeek Harness
- 安装轻：没有 npm install，Node 20+ 即可
- 讲解页：还支持把回答转成讲解页或短视频

（来源：[官方仓库](https://github.com/QingYunA/answer-me-with-html)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 4.6k stars 10 月新项目 | 名称搜索仅 8 条结果 |
| 输出形态新 | 把长答案变成一页可读文档 |
| 省 token | 官方实测模型输出约为手写 HTML 的 1/8 |
| 客户端多 | Claude Code、Codex、Cursor、OpenCode 等都能装 |
| 安装简单 | Node 20+ 加一条 npx skills 命令 |
| MIT 可商用可二开 | — |

| 需要注意 | 说明 |
|---|---|
| 必须用支持技能的 Agent 普通聊天窗口用不了 | — |
| 会改动全局技能目录卸载要手动清理 | — |
| 生成质量依赖模型理解能力 | — |
| 不是文档生成 SaaS 没有托管服务 | — |
| 项目很新 接口和输出结构可能变化 | — |

> 以上基于官方文档与社区反馈整理（2026-10-29），以官方最新文档为准。

## 快速部署（官方方式）

```bash
node -e "const a=+process.versions.node.split('.')[0]; if(a<20){console.error('需要 Node.js 20+，当前 '+process.versions.node);process.exit(1)}"
npx -y skills add QingYunA/answer-me-with-html -g -y
echo "安装完成：在 Agent 里问一个复杂问题试试"
```

部署步骤来源：[https://github.com/QingYunA/answer-me-with-html/blob/main/INSTALL.md](https://github.com/QingYunA/answer-me-with-html/blob/main/INSTALL.md)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 与 INSTALL.md 确认 Node 20+、npx skills 安装方式 | 已核对 2026-10-29 |
| 仓库 License 为 MIT | 已核对 2026-10-29 |
| 未实测安装与生成（会写入 Agent 技能目录） | 说明 2026-10-29 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-10-29 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-29 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身是 Agent 技能，不含 MCP；本仓库的 MCP 只提供安装步骤、客户端差异与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-29）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\answer-me-with-html-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 装完怎么用

1. 在支持技能的 Agent 里直接提问，例如：

   - Explain the TCP three-way handshake
   - Map out how the modules in this repo fit together
   - Redis or Memcached for our cache?

2. Agent 会写一份 Markdown 草稿，再调用技能自带的 CLI 生成 HTML
3. 生成结果通常是单文件，能直接打开、打印或发给别人

## 手动安装

不想用 npx 的话，克隆后把技能目录拷进对应客户端的 skills 目录：

```bash
git clone --depth 1 https://github.com/QingYunA/answer-me-with-html.git
cp -R answer-me-with-html/skills/answer-me-with-html ~/.claude/skills/answer-me-with-html
```

## 注意

- 技能会写进 Agent 的全局技能目录，装之前确认客户端支持 skills
- 生成的 HTML 用浏览器打开即可，不依赖网络
- 复杂图表仍受模型理解能力影响，关键结论建议人工核对

## 常见坑

- Node 版本不够：升级到 20+ 再执行 npx skills
- 装完 Agent 不调用：确认客户端支持 skills，并重启会话
- 找不到生成文件：看 Agent 输出里的路径，通常在技能输出目录
- npx 卡住：换 npm 镜像或先 npm i -g skills 再 skills add
- 页面图表错位：换更擅长长文本的模型重试
- 想卸载：删除对应客户端的 skills/answer-me-with-html 目录

## 免责声明

本仓库为第三方指南，与 Answer me with HTML 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-29），项目迭代快，请以[官方文档](https://github.com/QingYunA/answer-me-with-html/blob/main/INSTALL.md)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
