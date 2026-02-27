# My-Claudesidian: Claude Code + Obsidian 入门套件

使用 Claude Code 将你的 Obsidian vault 变成 AI 驱动的第二大脑。

## 这是什么？

这是一个预配置的 Obsidian vault 结构，专为与 Claude Code 无缝协作而设计，让你能够：

- 将 AI 用作思考伙伴，而不仅仅是写作助手
- 使用 PARA 方法组织知识
- 使用 Git 进行版本控制
- 从任何地方访问你的 vault（包括移动设备）

## 快速开始

### 1. 获取入门套件

**选项 A：使用 Git 克隆**

```bash
# 使用你喜欢的文件夹名称克隆（将 'my-vault' 替换为你喜欢的任何名称）
git clone https://github.com/jelin-sh/my-claudesidian.git my-vault
cd my-vault

# 示例：
# git clone https://github.com/jelin-sh/my-claudesidian.git obsidian-notes
# git clone https://github.com/jelin-sh/my-claudesidian.git knowledge-base
# git clone https://github.com/jelin-sh/my-claudesidian.git second-brain
```

**选项 B：下载 ZIP（不需要 Git）**

1. 在 GitHub 上点击"Code" → "Download ZIP"
2. 解压到你想要的位置
3. 在 Claude Code 中打开该文件夹

### 2. 运行设置向导

```bash
# 在目录中启动 Claude Code
claude

# 运行交互式设置向导（在 Claude Code 中）
/init-bootstrap
```

这将：

- 自动安装依赖
- 从原始 claudesidian 仓库断开连接
- **智能分析**你现有的 vault 结构和模式
- **安全导入**你现有的 Obsidian vault 到 OLD_VAULT/（如果你有）
- **研究你的公开作品**以获取个性化上下文（需要你的许可）
- 询问你的工作流偏好
- 创建个性化的 CLAUDE.md 配置
- 设置你的文件夹结构
- 初始化 Git 进行版本控制

### 3. 在 Obsidian 中打开（可选但推荐）

- 下载 [Obsidian](https://obsidian.md)
- 从 claudesidian 文件夹打开 vault
- 这与 Claude Code 并行提供可视化界面

### 4. 你的第一次会话

告诉 Claude Code：

```
我正在开始一个关于 [主题] 的新项目。
我处于思考模式，不是写作模式。
请搜索我的 vault 以查找任何相关的现有笔记，
然后通过提问帮助我探索这个主题。
```

或使用预配置的命令之一（在 Claude Code 中）：

```
/thinking-partner   # 用于协作探索
/daily-review       # 用于一天结束时的反思
/research-assistant # 用于深入探讨主题
```

## 文件夹结构

```
my-claudesidian/
├── 00_Inbox/           # 新想法的临时捕捉点
├── 10_Projects/        # 活跃的、有时间限制的倡议
├── 20_Areas/           # 持续进行的责任
├── 30_Resources/       # 参考材料和知识库
├── 40_Archive/         # 已完成的项目和非活动项目
├── 50_Attachments/     # 图像、PDF 和其他文件
├── 60_Metadata/        # Vault 配置和模板
│   ├── Reference/      # 文档和指南
│   └── Templates/      # 可重用的笔记模板
└── .scripts/           # 自动化辅助脚本
```

## 核心概念

### 思考模式 vs 写作模式

**思考模式**（研究与探索）：

- Claude 提问以理解你的目标
- 搜索现有笔记中的相关内容
- 帮助建立想法之间的联系
- 维护见解和进度的日志

**写作模式**（内容创建）：

- 基于你的研究生成草稿
- 帮助构建和编辑内容
- 创建最终可交付成果

### PARA 方法

**Projects（项目）**：有截止日期和具体结果

- 示例："2025 年 Q4 市场策略"
- 在 `10_Projects/` 中创建文件夹

**Areas（领域）**：持续进行，无结束日期

- 示例："健康"、"财务"、"团队管理"
- 放在 `20_Areas/` 中

**Resources（资源）**：持续感兴趣的主题

- 示例："AI 研究"、"写作技巧"
- 存储在 `30_Resources/` 中

**Archive（归档）**：非活动项目

- 已完成的项目及其输出
- 不再相关的旧笔记

## Claude Code 命令

预配置的 AI 助手，随时可用：

- `thinking-partner` - 通过提问探索想法
- `inbox-processor` - 整理你的捕捉内容
- `research-assistant` - 深入探讨主题
- `daily-review` - 一天结束时的反思
- `weekly-synthesis` - 在一周中找到模式
- `create-command` - 构建新的自定义命令
- `de-ai-ify` - 从文本中删除 AI 写作模式
- `upgrade` - 更新到最新的 claudesidian 版本
- `init-bootstrap` - 重新运行设置向导
- `install-claudesidian-command` - 安装 shell 命令，从任何位置启动 vault

运行方式：在 Claude Code 中使用 `/[命令名称]`

### 使用 `/upgrade` 保持更新

Claudesidian 在你启动 Claude Code 时会自动检查更新，并在有新功能可用时提醒你运行 `/upgrade`。

升级命令智能地合并新功能，同时保留你的自定义：

```bash
# 预览将要更新的内容（推荐先运行）
/upgrade check

# 运行交互式升级
/upgrade

# 跳过确认进行安全更新（高级）
/upgrade force
```

**升级的作用：**

- 在进行任何更改之前创建带时间戳的备份
- 在更新之前显示每个文件的差异
- 保留你的个人笔记和自定义
- 仅更新系统文件（命令、代理、脚本）
- 从不触碰你的内容文件夹（00_Inbox、10_Projects 等）
- 如果需要提供回滚功能

**安全功能：**

- 你的所有个人内容都受到保护
- 在 `.backup/upgrade-[timestamp]/` 中创建完整备份
- 逐个文件的审查和确认
- 在 `.upgrade-checklist.md` 中跟踪进度
- 可以随时停止和恢复

## 辅助脚本

使用 `pnpm` 运行：

- `attachments:list` - 显示未处理的附件
- `attachments:organized` - 计算已组织的文件
- `attachments:sizes` - 查找大文件
- `attachments:orphans` - 查找未引用的附件
- `vault:stats` - 显示 vault 统计信息

## 高级设置

### 从任何位置快速启动

安装 shell 命令以从任何目录启动你的 vault：

```bash
# 在 Claude Code 中，运行：
/install-claudesidian-command
```

这将创建一个 `claudesidian` 别名，它会：

- 自动切换到你的 vault 目录
- 尝试恢复你现有的会话（如果存在）
- 回退到启动新会话
- 完成后返回到你的原始目录

**使用方法：**

```bash
# 从终端的任何位置：
claudesidian

# 它将自动恢复你最后的会话或启动新会话
```

该命令会添加到你的 shell 配置（~/.zshrc、~/.bashrc 等），因此在终端会话之间持久存在。

### Git 集成

初始化 Git 进行版本控制：

```bash
git init
git add .
git commit -m "Initial vault setup"
git remote add origin your-repo-url
git push -u origin main
```

最佳实践：

- 每个工作会话后提交
- 使用描述性的提交消息
- 开始工作前先拉取

### 移动访问

1. 设置一个小型服务器（迷你 PC、云 VPS 或家庭服务器）
2. 安装 Tailscale 以实现安全 VPN 访问
3. 将你的 vault 克隆到服务器
4. 在移动设备上使用 Termius 或类似 SSH 客户端
5. 远程运行 Claude Code

### 自定义命令

通过在 `.claude/commands/` 中保存指令来创建专用命令：

**研究助手**（`60_Metadata/Agents/research-assistant.md`）：

```markdown
你是一个研究助手。

- 在 vault 中搜索相关信息
- 综合多个来源的发现
- 识别知识空白
- 建议进一步探索的领域
```

## 提示和最佳实践

### 来自经验

1. **从思考模式开始**：抗拒立即生成内容的冲动
2. **做一个 Token 极大主义者**：更多上下文 = 更好结果
3. **保存一切**：捕捉聊天、片段、部分想法
4. **信任但验证**：始终阅读 AI 生成的内容
5. **打断你的流程**：AI 帮助你轻松恢复

## 故障排除

### Claude Code 找不到我的笔记

- 确保你从 vault 根目录运行 Claude Code
- 检查文件权限
- 验证 markdown 文件具有 `.md` 扩展名

### Git 冲突

- 开始工作前始终先拉取
- 使用清晰的消息频繁提交
- 使用分支进行实验性更改

### 附件管理

- 运行 `pnpm attachments:create-organized` 来设置文件夹
- 使用辅助脚本查找孤立文件
- 保持附件在 10MB 以下用于 Git

## 理念

这个设置基于关键原则：

1. **AI 放大思考，而不仅仅是写作**
2. **本地文件 = 完全控制**
3. **结构赋能创造力**
4. **迭代胜过完美**
5. **目标是洞察，而不仅仅是信息**

## 贡献

我们欢迎社区贡献！这是一个活模板，通过每个人的输入变得更好。

### 如何贡献

1. 在 GitHub 上 **Fork 仓库**
2. **创建功能分支**（`git checkout -b feature/amazing-feature`）
3. **进行你的更改**
4. **测试你的更改** 以确保一切正常
5. **提交你的更改**（`git commit -m 'Add amazing feature'`）
6. **推送到分支**（`git push origin feature/amazing-feature`）
7. **打开 Pull Request** 并清楚描述你做了什么

### 我们在寻找什么

- **新命令**：用于常见工作流的有用 Claude Code 命令
- **新代理**：用于特定任务的专业代理
- **文档改进**：更好的解释、示例或指南
- **错误修复**：发现损坏的东西？修复它！
- **工作流模板**：分享你的高效工作流
- **辅助脚本**：使 vault 管理更简单的自动化工具
- **集成指南**：将 Claudesidian 与其他工具连接
- **核心更新**：升级系统、设置向导或其他核心功能的改进

### 指南

- 保持命令专注和单一用途
- 编写清晰的文档和示例
- 提交前彻底测试
- 遵循现有代码风格和结构
- 使用你的更改更新 CHANGELOG.md
- **欢迎使用 AI 生成的内容，但你必须在提交前仔细阅读和审查所有内容** - 永远不要提交你不理解的代码

### 获取更新

当新功能被贡献并合并时，用户可以通过以下方式轻松获得：

```bash
/upgrade
```

升级命令智能地合并新功能，同时保留你的个人自定义，使你能够从社区贡献中受益而不会丢失你的工作。

### 有问题或想法？

- 在开始工作之前打开 issue 讨论重大更改
- 加入现有 issue 中的讨论
- 分享你的用例 - 它们帮助我们更好地理解需求

记住：最佳实践来自使用，而不是理论。你的真实经验让这对每个人都更好！

## 资源

- [Obsidian 文档](https://help.obsidian.md)
- [PARA 方法](https://fortelabs.com/blog/para/)
- [Claude Code 文档](https://claude.ai/docs)

## 灵感

这个入门套件的灵感来自以下讨论的工作流：

- [如何将 Claude Code 用作第二大脑](https://every.to/podcast/how-to-use-claude-code-as-a-thinking-partner) - Noah Brier 对 Dan Shipper 的采访
- 由 [Alephic](https://alephic.com) 团队构建 - 一家 AI 优先的战略和软件合作伙伴，帮助组织通过定制 AI 系统解决复杂挑战

## 许可证

MIT - 随意使用。让它成为你自己的。

---

_记住：自行车一开始感觉摇摇晃晃，然后你会忘记它曾经很难。_
