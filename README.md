# 🧠 My-Claudesidian: Claude Code + Obsidian 入门套件

使用 Claude Code 将你的 Obsidian vault 变成 AI 驱动的第二大脑。

## ✨ 简介

My-Claudesidian 是一个预配置的 Obsidian vault 结构，专为与 Claude Code 无缝协作而设计。它结合了 PARA 方法论、Git 版本控制和 AI 驱动的工作流，帮助你构建一个强大的知识管理系统。

**核心特性：**

- **AI 思考伙伴**：将 Claude Code 用作思考伙伴，而不仅仅是写作助手
- **PARA 方法**：使用 Projects（项目）、Areas（领域）、Resources（资源）、Archive（归档）组织知识
- **Git 版本控制**：完整的版本追踪，支持多设备同步
- **跨平台访问**：从桌面到移动设备，随时随地访问你的知识库

## 📦 前置要求

### 必需工具

- **[Git](https://git-scm.com/)** - 版本控制系统
- **[Obsidian](https://obsidian.md/)** - 笔记应用

## 🚀 快速开始

### 1. 获取项目

**选项 A：使用 Git 克隆**

```bash
# 克隆仓库（可替换为自定义文件夹名称）
git clone https://github.com/jelin-sh/my-claudesidian.git my-vault
cd my-vault
```

**选项 B：下载 ZIP**

1. 访问 [GitHub 仓库](https://github.com/jelin-sh/my-claudesidian)
2. 点击"Code" → "Download ZIP"
3. 解压到你想要的位置

### 2. 运行设置向导

```bash
# 在项目目录中启动 Claude Code
claude

# 在 Claude Code 中运行设置向导
/init-bootstrap
```

设置向导将引导你完成：

- 从原始仓库断开连接，创建独立的个人 vault
- 导入现有 Obsidian 笔记（如果有）
- 配置个性化工作流偏好
- 创建自定义的 CLAUDE.md 配置文件
- 初始化 Git 版本控制

### 4. 在 Obsidian 中打开

1. 下载并安装 [Obsidian](https://obsidian.md)
2. 打开 Obsidian，选择"打开文件夹作为 vault"
3. 选择你的 claudesidian 项目文件夹

Obsidian 提供可视化界面，与 Claude Code 并行使用，发挥各自优势。

## 📂 文件夹结构

```
my-claudesidian/
├── 00_Inbox/           # 新想法的临时捕捉点
├── 10_Projects/        # 活跃的、有时间限制的倡议
├── 20_Areas/           # 持续进行的责任
├── 30_Resources/       # 参考材料和知识库
├── 40_Archive/         # 已完成的项目和非活动项目
├── 50_Attachments/     # 图像、PDF、视频等文件
│   └── Organized/      # 已处理的附件
├── 60_Metadata/        # Vault 配置和模板
│   ├── Reference/      # 文档和指南
│   └── Templates/      # 可重用的笔记模板
└── .claude/            # Claude Code 配置
    ├── commands/       # 斜杠命令
    ├── skills/         # 技能模块
    └── scripts/        # 辅助脚本
```

### 文件夹说明

| 文件夹 | 用途 | 示例 |
|--------|------|------|
| `00_Inbox` | 快速捕捉想法和信息的临时存放点 | 会议笔记、随机想法、待整理内容 |
| `10_Projects` | 有明确目标和截止日期的短期项目 | "2025 年市场计划"、"新产品发布" |
| `20_Areas` | 需要长期关注的持续责任 | "健康"、"财务"、"团队管理" |
| `30_Resources` | 感兴趣的主题和参考材料 | "AI 研究"、"写作技巧"、"烹饪" |
| `40_Archive` | 已完成项目和非活动内容的长期存储 | 2024 年已完成的项目 |
| `50_Attachments` | 所有附件文件的集中存储 | 图片、PDF、视频、音频 |
| `60_Metadata` | 系统配置和模板 | 文档模板、配置文件 |

## 💡 可用命令

### 🎯 核心命令

在 Claude Code 中使用 `/命令名` 调用。

| 命令 | 描述 |
|------|------|
| `/init-bootstrap` | 交互式设置向导（首次使用或重新配置） |
| `/thinking-partner` | 通过提问协作探索想法 |
| `/daily-review` | 每日回顾工作流 |
| `/inbox-processor` | 整理收件箱中的内容 |
| `/research-assistant` | 深度研究工作流 |

### 🛠️ 实用命令

| 命令 | 描述 |
|------|------|
| `/create-command` | 创建新的自定义命令 |
| `/de-ai-ify` | 去除文本中的 AI 写作风格 |

### ⚙️ 管理命令

| 命令 | 描述 |
|------|------|
| `/pull-request` | 创建拉取请求 |
| `/pragmatic-review` | 代码审查（专注 YAGNI 和 KISS 原则） |

## 🔧 辅助脚本

项目包含一些实用的 Bash 脚本：

```bash
# Vault 统计
.scripts/vault-stats.sh               # 显示 vault 统计信息

# 字幕提取
.scripts/transcript-extract.sh        # 从 YouTube 视频提取字幕
```

## 🧩 技能（Skills）

技能是自动加载的专业知识模块，在特定场景下提供帮助：

| 技能 | 描述 |
|------|------|
| `git-worktrees` | Git 工作树管理，用于并行开发 |
| `json-canvas` | JSON Canvas（思维导图、流程图）支持 |
| `obsidian-bases` | Obsidian 数据库视图 |
| `obsidian-markdown` | Obsidian Markdown 语法和特性 |
| `systematic-debugging` | 系统化调试方法论 |

## 🔢 目录编号规则

My-Claudesidian 使用两位数前缀确保跨平台的一致排序：

### 主目录（00-60）

| 编号 | 目录 | 用途 |
|------|------|------|
| 00 | Inbox | 捕捉入口 |
| 10 | Projects | 活跃项目 |
| 20 | Areas | 持续领域 |
| 30 | Resources | 知识资源 |
| 40 | Archive | 历史归档 |
| 50 | Attachments | 附件存储 |
| 60 | Metadata | 系统配置 |

### 子目录编号

主目录内的子目录使用编号系统维持顺序：

- **00-09**：紧急/高优先级项目
- **10-19**：短期项目（几周到几个月）
- **20-29**：中期项目（几个月到一年）
- **30-39**：长期项目（一年以上）
- **90-99**：模板/参考材料

这种编号系统确保：
- 在任何操作系统上保持一致的文件夹顺序
- 清晰的优先级排序
- 易于扩展和组织

## 📋 PARA 方法简介

**Projects（项目）** - 有明确目标和截止日期的短期任务

- 示例："2025 年产品发布会"
- 存放位置：`10_Projects/2025-产品发布会/`

**Areas（领域）** - 需要持续关注的长期责任

- 示例："个人健康"、"财务管理"
- 存放位置：`20_Areas/健康/`

**Resources（资源）** - 持续感兴趣的主题和参考资料

- 示例："人工智能研究"、"写作技巧"
- 存放位置：`30_Resources/AI-研究/`

**Archive（归档）** - 已完成项目和非活动内容的长期存储

- 示例：已完成的项目、旧的会议笔记
- 存放位置：`40_Archive/2024/`

## 💼 工作流程建议

### 🧠 思考模式 vs ✍️ 写作模式

**思考模式**（研究与探索）：
- Claude 提问以理解你的目标
- 搜索现有笔记中的相关内容
- 帮助建立想法之间的联系
- 维护见解和进度的日志

**写作模式**（内容创建）：
- 基于研究生成草稿
- 帮助构建和编辑内容
- 创建最终可交付成果

### 📅 每日使用流程

1. **晨间规划**：查看今日任务，确定工作重点
2. **捕捉想法**：将新想法放入 `00_Inbox/`
3. **深度工作**：使用 `/thinking-partner` 探索复杂问题
4. **定期整理**：使用 `/inbox-processor` 整理收件箱
5. **日终回顾**：使用 `/daily-review` 反思一天的工作

## 🤝 贡献

我们欢迎社区贡献！

### 如何贡献

1. Fork 本仓库
2. 创建功能分支（`git checkout -b feature/amazing-feature`）
3. 提交更改（`git commit -m 'Add amazing feature'`）
4. 推送到分支（`git push origin feature/amazing-feature`）
5. 创建 Pull Request

### 贡献指南

- 保持命令专注和单一用途
- 编写清晰的文档和示例
- 提交前彻底测试
- 遵循现有代码风格
- 更新 CHANGELOG.md
- **审查所有 AI 生成的内容后再提交**

### 寻求的贡献

- 新命令和工作流模板
- 文档改进和错误修复
- 辅助脚本和集成指南
- 核心功能优化

## 📚 资源链接

- [Obsidian 文档](https://help.obsidian.md)
- [Claude Code 文档](https://claude.ai/docs)
- [PARA 方法介绍](https://fortelabs.com/blog/para/)

## 📄 许可证

MIT License - 请随意使用和定制，让它成为你自己的作品。


