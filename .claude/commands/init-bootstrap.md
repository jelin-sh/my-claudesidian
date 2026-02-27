---
name: init-bootstrap
description:
  Interactive setup wizard that helps new users create a personalized CLAUDE.md
  file based on their Obsidian workflow preferences
allowed-tools: [Read, Write, MultiEdit, Bash, Task]
argument-hint: "(optional) path to existing vault or 'new' for fresh setup"
---

# 初始化引导配置

此命令帮助你创建个性化的 CLAUDE.md 配置文件，通过询问关于你的 Obsidian 工作流程和偏好。

## 任务

阅读 CLAUDE-BOOTSTRAP.md 模板并交互式收集关于用户以下信息：

- 现有 vault 结构（如果有）
- 工作流程偏好
- 笔记风格
- 组织方法
- 特定需求

然后生成适合他们需求的定制 CLAUDE.md 文件。

## 流程

1. **初始环境设置**
   - 使用 `date` 命令获取当前日期作为时间戳
   - 检查当前文件夹名称并询问是否要重命名
   - 如果是，引导他们完成重命名（处理父目录移动）
   - 检查 package.json 并安装依赖：
     - 首先尝试 `pnpm install`（更快、更好）
     - 如果 pnpm 不可用则回退到 `npm install`
   - 验证核心依赖已安装
   - 检查 git 状态：
     - 如果没有 .git 文件夹：初始化 git 仓库
     - 如果有远程 origin：询问开发工作
       - 个人 vault：移除 origin 和 .github 文件夹
       - 贡献者：保留 origin 和工作流完整
     - 如果是干净的本地仓库：准备就绪
   - 暂不创建文件夹 - 等到询问组织方法后

2. **检查现有配置**
   - 查找现有的 CLAUDE.md
   - 如果存在，询问是否要更新或重新开始
   - 检查 CLAUDE-BOOTSTRAP.md 模板

3. **收集 Vault 信息**
   - 搜索常见位置的现有 Obsidian vaults（.obsidian 文件夹）
   - 检查这些路径并使用适当的深度限制：
     - `~/Documents`（maxdepth 3）- 所有平台
     - `~/Desktop`（maxdepth 3）- 所有平台
     - `~/Library/Mobile Documents/iCloud~md~obsidian/Documents`（maxdepth 5 -
       **仅 macOS**，iCloud vaults）
     - 主目录 `~/`（maxdepth 2）- 所有平台
     - 当前目录父级（maxdepth 2）- 所有平台
   - 如果找到，询问："在 [path] 找到 Obsidian vault。这是你想导入的 vault 吗？"
   - 正确计数文件：`find [path] -type f -name "*.md" | wc -l`（无深度限制）
   - 显示 vault 大小：`du -sh [path]`
   - 如果确认，分析 vault 结构：
     - 运行 `tree -L 3 -d [path]` 查看文件夹层次结构
     - 抽样 10-15 个随机笔记以了解内容类型
     - 列出 30-50 个最近的文件名以检测命名模式
     - 检查每日笔记文件夹和格式
     - 识别最活跃的文件夹（按文件计数）
     - 检测是否使用 PARA、Zettelkasten、Johnny Decimal 或自定义方法
   - 如果不是正确的或没有找到：
     - **仅 macOS 上**：询问："你的 vault 存储在 iCloud Drive 中吗？（是/否）"
     - 如果是（macOS）："请输入 vault 的完整路径（例如，
       ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/YourVault）"
     - 如果否，或在 Linux/Windows 上："请输入现有 vault 的路径，或输入 'skip' 从头开始"
     - **验证用户提供的路径**（见下面的"用户路径验证"部分）
   - 如果没有现有 vault 或用户跳过，他们将从头开始

4. **询问配置问题**
   - "你叫什么名字？"（用于个性化）
   - "你希望我研究你的公开作品以更好地了解你的背景吗？"
     - 如果是：搜索信息
     - 始终显示发现并询问"这正确吗？"以确认
     - 如果找到多人，列出来编号供选择
     - 如果错误的人，提供再次搜索或跳过
     - 保存关于其工作、写作风格、专业领域的相关背景
   - "你遵循 PARA 方法还是有不同的组织系统？"
   - "你的主要用例是什么？（研究、写作、项目管理、知识库、每日笔记）"

   **如果使用 PARA，询问特定的设置问题：**
   [PARA Method by Tiago Forte](https://fortelabs.com/blog/para/)
   - "你正在处理哪些活跃项目？"（在 10_Projects 中创建文件夹）
   - "你维护哪些责任领域？"（例如，工作、健康、财务、家庭）
   - "你经常研究哪些主题？"（在 30_Resources 中设置）
   - "你最近完成了哪些项目？"（可以用摘要归档）

   **一般偏好：**
   - 检查 .obsidian/community-plugins.json 查看他们使用什么插件
   - 分析现有文件以自动检测命名约定
   - 检查附件文件夹以查看他们是否处理媒体文件
   - "你使用 git 进行版本控制吗？"
   - "你经常引用任何特定网站或资源吗？"
   - "你有任何特定的写作风格偏好吗？"
   - "你希望 Claude 遵循任何工作流程或模式吗？"
   - "你想要每周回顾仪式吗？（例如，周四项目回顾）"
   - "你偏好'思考模式'（问题/探索）还是'写作模式'？"

5. **可选工具设置**

   **Gemini Vision（已包含）**
   - 询问："Gemini Vision 已包含用于分析图片、PDF 和视频。
     你想激活它吗？（是/否/稍后）"
   - 解释："你只需要从 Google 获取免费的 API 密钥。这让 Claude 可以分析你 vault 中的任何视觉内容。"
   - 如果稍后："没问题！你可以随时运行 `/setup-gemini` 设置"
   - 如果是：
     - 引导从 https://aistudio.google.com/apikey 获取 API 密钥（免费，需要 30 秒）
     - 帮助添加到 shell 配置文件（.zshrc、.bashrc 等）
     - 运行
       `claude mcp add --scope project gemini-vision node .claude/mcp-servers/gemini-vision.mjs`
     - 用 API 密钥配置 .mcp.json
     - 使用示例命令测试连接

   **Firecrawl（已包含）**
   - 询问："Firecrawl 已包含用于网络研究。你想设置它吗？（是/否/稍后）"
   - 解释："这是研究的游戏规则改变者！当你找到文章或网站时，你可以直接将其保存为 markdown 到 vault - 永久保留内容，使其可搜索，并让 Claude 分析它。非常适合构建研究库。"
   - 示例："只需告诉 Claude：'将这篇文章保存到我的 vault：[URL]' 就完成了！"
   - 如果稍后："你可以随时运行 `/setup-firecrawl` 设置"
   - 如果是：
     - 引导从 https://firecrawl.dev 获取 API 密钥（有免费层）
     - 帮助配置 .scripts/ 中的脚本
     - 显示使用示例：`.scripts/firecrawl-scrape.sh https://example.com`

6. **生成定制配置**
   - 获取当前日期：`date +"%B %d, %Y"` 用于 CLAUDE.md 标题
   - 将偏好保存到 `.claude/vault-config.json`：
     ```json
     {
       "user": {
         "name": "张三",
         "background": {
           "companies": ["Variance", "Percolate"],
           "roles": ["联合创始人", "作家"],
           "publications": ["Why Is This Interesting?", "every.to"],
           "expertise": [
             "开发者工具",
             "营销技术",
             "系统思维"
           ],
           "interests": ["AI 辅助思考", "笔记系统", "创造力"]
         },
         "profileSources": [
           "https://whyisthisinteresting.com/about",
           "https://every.to/@username"
         ],
         "customContext": "专注于 AI 作为思考增强，而不仅仅是写作",
         "publicProfile": true
       },
       "vaultPath": "/path/to/existing/vault",
       "fileNamingPattern": "detected-pattern",
       "organizationMethod": "PARA",
       "primaryUses": ["research", "writing", "projects"],
       "tools": {
         "geminiVision": true,
         "firecrawl": false
       },
       "projects": ["书 - 生产力", "SaaS 应用"],
       "areas": ["简报", "健康"],
       "importedAt": "2025-01-13",
       "lastUpdated": "2025-01-13"
     }
     ```
   - 以 CLAUDE-BOOTSTRAP.md 为基础
   - 添加用户特定部分：
     - 包含其实际项目/领域的定制文件夹结构
     - 个人工作流程
     - 首选工具和脚本
     - 特定指南
     - 如果已设置，MCP 配置
   - 如果提供，包含他们的网站/资源
   - 添加任何自定义命名约定
   - 用他们的项目和领域预填充：
     - 在 10_Projects/ 中创建项目文件夹
     - 在 20_Areas/ 中创建领域文件夹
     - 在 30_Resources/ 中创建资源主题
     - 为每个项目/领域添加 README 文件

7. **导入现有 Vault（如果适用）**
   - 如果用户有现有 vault：
     - 创建 OLD_VAULT 文件夹：`mkdir OLD_VAULT`
     - 完整复制 vault 保留结构：
       `cp -r [vault-path]/* ./OLD_VAULT/`
     - 复制 Obsidian 配置：`cp -r [vault-path]/.obsidian ./`
     - 检查并复制其他重要文件：
       - `.trash/`（Obsidian 的垃圾文件夹）
       - `.smart-connections/`（如果使用该插件）
       - 任何工作区文件：`.obsidian.vimrc` 等
     - 跳过复制：`.git/`（他们有自己的）、`.claude/`（使用我们的）
     - 显示摘要："已将你的 vault 导入到 OLD_VAULT/（X 文件，Y 文件夹）"
     - 解释："你的原始结构在 OLD_VAULT 中保留。你可以根据需要逐步将文件迁移到 PARA 文件夹。"

8. **创建支持文件**
   - 如果是新 vault，生成初始文件夹结构
   - 为主要文件夹创建 README 文件
   - 对于每个项目文件夹，创建子文件夹：
     - Research/（源材料）
     - Chats/（AI 对话）
     - Daily Progress/（运行日志）
   - 创建 50_Attachments/Organized/ 目录
   - 如果使用 git，设置 .gitignore（包括 .mcp.json、node_modules）
   - 如果要求，创建初始模板
   - 如果用户想要回顾仪式，创建 WEEKLY_REVIEW.md
   - 如果存在，移除 FIRST_RUN 标记文件
   - 如果初始化了仓库，进行初始 git 提交

9. **运行测试命令**
   - 执行 `pnpm vault:stats` 验证脚本工作
   - 如果文件夹存在，测试附件命令
   - 如果配置了，测试 MCP 工具
   - 验证 git 正确跟踪文件

10. **提供下一步**

- 创建和配置内容的摘要
- 针对其设置的快速入门指南
- 他们可以使用的可用命令列表
- 验证一切工作的测试命令
- 基于其用例的首批任务建议
- 稍后如何修改配置

## 示例输出

```markdown
# 你的 Obsidian Vault 配置

生成日期：[运行 `date +"%B %d, %Y"` 获取当前日期]
最后更新：[同一日期]
基于你的偏好：[主要用例]
设置完成包含：✅ 依赖 ✅ 文件夹结构 ✅ Git 初始化

## 你的定制文件夹结构

[他们的特定结构及说明]

## 你的工作流程

### 每日例程

[基于他们的回答]

### 项目管理

[他们的特定方法]

### 研究方法（Noah Brier 风格）

- 捕捉你阅读的所有内容
- 让重要想法自然浮现
- 从写作开始以测试理解
- 使用搜索，而不是标签，来查找事物
- [从 Noah 的系统了解更多](https://every.to/superorganizers/ceo-by-day-internet-sleuth-by-night-267452)

### 每周回顾仪式

[如果启用：每周四下午 4 点，回顾所有项目]

## 你的偏好

### 文件命名

- 模式：[他们的约定]
- 示例：[特定示例]

### 工具和脚本

[与其工作流程相关的脚本]

## MCP 服务器（如果配置）

### Gemini Vision

- 状态：✅ 已配置和测试
- API 密钥：在 .mcp.json 中设置
- 测试：`使用 gemini-vision 分析 [图片路径]`

## 可用命令

### Vault 管理

- `pnpm vault:stats` - 显示 vault 统计信息
- `pnpm attachments:list` - 列出未处理的附件
- `pnpm attachments:organized` - 计算已组织的文件

### Claude 命令

- `claude run thinking-partner` - 协作思考模式
- `claude run daily-review` - 回顾你的一天
- `claude run init-bootstrap` - 重新运行此设置

## 快速入门

1. [个性化第一步]
2. [基于其目标的下一步行动]
3. [特定于其工作流程]

## 研究大师的专业技巧

- **做 token 极大主义者**：为 Claude 提供大量背景
- **写作可扩展**：记录所有内容以供将来参考
  ([Noah Brier](https://every.to/superorganizers/ceo-by-day-internet-sleuth-by-night-267452))
- **信任涌现**：重要的想法会不断浮现
- **从写作开始**：始终以文本形式开始项目
- **定期回顾**：每周留出时间修剪和更新
- **PARA 方法**：Projects、Areas、Resources、Archive
  ([Tiago Forte](https://fortelabs.com/blog/para/))

## 设置摘要

✅ 依赖已安装（pnpm/npm）
✅ 文件夹结构已创建
✅ Git 仓库已初始化并从原始仓库断开
✅ CLAUDE.md 已个性化
✅ 首次运行设置已完成
[✅ MCP Gemini Vision 已配置 - 如果已设置]
[✅ 首次提交已完成 - 如果初始化了 git]
```

## 重要实现说明

### 处理多个 Vault

当检测到多个 vault 时：

1. **始终列出所有找到的 vault** 并带有清晰编号和详细信息
2. **要求明确选择** - 不要假设使用哪个 vault
3. **在选择前确认选择** 然后继续导入
4. **处理模糊响应** - 如果用户提供不清楚的输入（如粘贴屏幕截图），请求澄清：
   - "我看到你分享了屏幕截图。你能输入你想导入的 vault 的编号（1-3）吗？"
   - "我需要明确的回复。请输入 '1'、'2' 或 '3' 选择一个 vault，或 'skip' 从头开始。"

### 在没有明确确认的情况下绝不继续

如果用户响应不清楚：

- 不要猜测或假设
- 请求明确确认
- 再次提供清晰的选项
- 示例："我想确保我导入正确的 vault。请输入你选择的编号（1、2 或 3）。"

### 平台兼容性

此命令设计为跨 Linux、macOS 和 Windows（WSL/Git Bash）工作，具有平台特定功能：

**所有平台：**

- 搜索 ~/Documents、~/Desktop、主目录
- 标准 Obsidian vault 检测
- 完整 vault 导入和设置

**仅 macOS：**

- iCloud Drive vault 检测和导入
- Obsidian 的 iCloud 同步仅限 macOS，因此其他平台上禁用 iCloud 功能

**平台检测：**

```bash
# 检查平台
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS - 启用 iCloud 功能
  PLATFORM="macOS"
  ICLOUD_SUPPORTED=true
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  PLATFORM="Linux"
  ICLOUD_SUPPORTED=false
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  # Windows (Git Bash or WSL)
  PLATFORM="Windows"
  ICLOUD_SUPPORTED=false
fi
```

### iCloud Vault 搜索实现

搜索 vault 时，使用此 find 命令模式：

```bash
# 标准位置（浅层搜索）
# 注意：2>/dev/null 抑制来自系统目录的预期权限错误
# 如果没有找到 vault，我们将询问用户的 vault 路径
find ~/Documents ~/Desktop -maxdepth 3 -type d -name ".obsidian" 2>/dev/null

# iCloud 位置（需要更深的搜索由于嵌套文件夹结构）
# 仅在 macOS 上搜索
if [[ "$OSTYPE" == "darwin"* ]]; then
  find ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents -maxdepth 5 -type d -name ".obsidian" 2>/dev/null
fi

# 主目录（浅层以避免深度递归）
find ~ -maxdepth 2 -type d -name ".obsidian" 2>/dev/null
```

iCloud 路径需要：

- 更高的 maxdepth（5）由于嵌套文件夹结构
- 转义路径名中的空格
- 静默错误处理（2>/dev/null），因为许多用户没有 iCloud
- 平台检查（仅 macOS）

**错误处理注意：** 权限错误被抑制（2>/dev/null），因为它们在搜索系统目录时期望出现。如果没有找到 vault，脚本优雅地提示用户输入 vault 路径。

### 用户路径验证

当用户手动提供 vault 路径时，彻底验证并带有有用的错误消息：

```bash
# 用户提供的路径
USER_PATH="$1"

# 展开波浪号并解析为绝对路径
USER_PATH="${USER_PATH/#\~/$HOME}"
REAL_PATH=$(realpath "$USER_PATH" 2>/dev/null)

# 验证 1：路径存在
if [ -z "$REAL_PATH" ]; then
  echo "❌ 错误：路径不存在：$USER_PATH"
  echo ""
  echo "💡 建议："
  echo "   • 检查路径中的拼写错误"
  echo "   • 确保使用完整路径（例如，/Users/name/vault）"
  echo "   • 你可以使用 ~ 作为主目录（例如，~/Documents/vault）"
  exit 1
fi

# 验证 2：是目录
if [ ! -d "$REAL_PATH" ]; then
  echo "❌ 错误：不是目录：$REAL_PATH"
  echo ""
  echo "💡 路径存在但指向文件，而不是文件夹。"
  exit 1
fi

# 验证 3：包含 .obsidian 文件夹
if [ ! -d "$REAL_PATH/.obsidian" ]; then
  echo "❌ 错误：不是有效的 Obsidian vault（无 .obsidian 文件夹）"
  echo "   查找位置：$REAL_PATH"
  echo ""
  echo "💡 建议："
  echo "   • 确保路径指向 vault 根目录（而不是子文件夹）"
  echo "   • 检查你至少在 Obsidian 中打开过此 vault 一次"
  echo "   • 尝试不带尾部斜杠的路径"
  echo "   • 对于 iCloud：~/Library/Mobile Documents/iCloud~md~obsidian/Documents/YourVault"
  exit 1
fi

# 验证 4：可读权限
if [ ! -r "$REAL_PATH/.obsidian" ]; then
  echo "❌ 错误：无法读取 vault 目录（权限被拒绝）"
  echo "   路径：$REAL_PATH"
  echo ""
  echo "💡 你可能需要："
  echo "   • 使用以下命令检查文件权限：ls -la \"$REAL_PATH\""
  echo "   • 确保你拥有此目录"
  exit 1
fi

# 如果与输入不同，显示解析的路径
if [ "$USER_PATH" != "$REAL_PATH" ]; then
  echo "✓ 解析路径：$REAL_PATH"
fi

# 有效的 vault 路径
VAULT_PATH="$REAL_PATH"
echo "✓ 找到有效的 Obsidian vault"
```

此验证：

- 正确展开 `~` 到主目录
- 将符号链接和相对路径解析为绝对路径
- 检查所有基本要求（存在、是目录、有 .obsidian、可读）
- 提供有用的、可操作的错误消息和建议
- 显示解析的路径以便用户理解正在检查的内容
- 信任用户（允许符号链接、主目录外的路径）
- 跨平台兼容（适用于 Linux、macOS、Windows/WSL）

### iCloud 同步状态检查

当用户选择 iCloud vault 时，检查同步状态并在需要时警告：

```bash
# 用户确认 vault 选择后
if [[ "$OSTYPE" == "darwin"* ]] && [[ "$vault_path" == *"iCloud"* ]]; then
  # 检查常见的 iCloud 同步指示器
  if [ -f "$vault_path/.icloud" ] || [ -f "$vault_path/.obsidian/.icloud" ]; then
    echo ""
    echo "📱 iCloud 同步通知："
    echo "   此 vault 似乎仍在从 iCloud 下载。"
    echo "   为获得最佳结果，请先在 Obsidian 中打开它以确保文件已同步。"
    echo ""
    read -p "仍然继续吗？（是/否）： " sync_answer
    if [[ ! "$sync_answer" =~ ^[Yy] ]]; then
      echo "没问题！先在 Obsidian 中打开 vault，然后重新运行 /init-bootstrap"
      exit 0
    fi
  else
    echo ""
    echo "📱 检测到 iCloud vault。如果导入似乎不完整，请确保同步已完成。"
    echo ""
  fi
fi
```

这提供了一个软警告：

- 仅在 macOS 上为 iCloud 路径运行
- 检查指示未完成下载的占位符文件
- 如果检测到同步问题，请求确认
- 即使没有问题也提供温和的提醒
- 让用户选择是否继续

## 交互示例

````
User: claude run init-bootstrap
Assistant: 欢迎！我将帮助你设置个性化的 Obsidian + Claude 配置。

📅 今天的日期：[从 `date +"%B %d, %Y"` 获取]

首先，让我检查你的设置...

📁 **文件夹名称检查**
当前文件夹：claudesidian
你想将此文件夹重命名为更个性化的名称吗？（例如，my-vault、knowledge-base、obsidian-notes）
*为什么：你的 vault 应该有一个对你有意义的名称 - 你每天都会看到它！*

[如果是：通过移动到父目录并返回来处理重命名]

现在设置你的环境...

📦 **安装依赖**
[检查 pnpm，如果不可用则使用 npm]
[使用 pnpm/npm 安装依赖]
*为什么：这些工具使 Claude Code 能有效地处理你的 vault*

🔓 **仓库设置**

**你将为 claudesidian 开发做出贡献吗？**
- **否**（仅个人 vault）→ 我将移除 GitHub 工作流并从仓库断开连接
- **是**（我想贡献）→ 我将保持开发设置完整

[实现:]
```bash
# 如果用户说"否"（个人 vault）：
rm -rf .github  # 移除 GitHub 工作流
git remote remove origin  # 从 claudesidian 仓库断开连接

# 如果用户说"是"（贡献）：
# 保留 .github 文件夹和 origin remote
echo "为贡献保留了开发设置"
````

_为什么：个人 vault 不需要 GitHub Actions，但贡献者从自动化中受益_

📂 **创建文件夹结构** [基于你选择的组织方法创建文件夹]
_为什么：良好的结构帮助你有效地组织和查找知识_

🎯 **完成设置** [检查 git 状态并移除首次运行标记]
_为什么：Git 给你版本控制，移除标记确保你不会再看到欢迎消息_

✅ 文件夹已重命名（如果请求）
✅ 依赖已安装
✅ 核心文件夹已创建
✅ Git 仓库就绪（从原始 claudesidian 断开连接）
✅ 首次运行标记已移除

现在让我问你几个问题来定制你的设置：

🔍 **搜索现有 Obsidian vaults...**
[搜索 ~/Documents、~/Desktop、主目录和父目录。在 macOS 上，还搜索 iCloud Drive]

### 案例 1：找到单个 Vault

在以下位置找到 Obsidian vault：~/Documents/MyNotes
📊 Vault 统计：2,517 个 markdown 文件，总共 1.1GB
你想导入此 vault 吗？

- **是** - 导入此 vault
- **否** - 搜索不同的 vault
- **跳过** - 从头开始而不导入
- **路径** - 手动指定不同的路径

User: 是

### 案例 2：找到多个 Vault

🔍 **找到多个 Obsidian vaults：**

1. **~/Documents/MyNotes**（2,517 个文件，1.1GB）
   - 最后修改：2 小时前
   - 包含：每日笔记、项目、资源

2. **~/Desktop/WorkVault**（892 个文件，450MB）
   - 最后修改：3 天前
   - 包含：客户项目、会议笔记

3. **~/Documents/ObsidianVault**（156 个文件，23MB）
   - 最后修改：2 周前
   - 包含：个人笔记、草稿

**你想导入哪个 vault？**

- 输入 **1-3** 选择一个 vault
- **all** - 导入所有 vault（每个到单独的文件夹）
- **skip** - 从头开始而不导入
- **path** - 手动指定不同的路径

User: 1

**确认你的选择：** 你选择了：~/Documents/MyNotes（2,517 个文件，1.1GB）

这正确吗？（是/否）

User: 是

太好了！我将把你的 vault 导入到 OLD_VAULT/，在那里它将被安全保存。
你可以根据自己的节奏将文件迁移到 PARA 文件夹。

### 案例 3：未找到 Vault（平台感知）

🔍 **在常见位置未找到 Obsidian vaults。**

**在 macOS 上：** 你的 vault 存储在 iCloud Drive 中吗？（是/否）

User: 是

请输入 vault 的完整路径：（例如：~/Library/Mobile Documents/iCloud~md~obsidian/Documents/YourVault）

User: ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/MyVault

[验证路径并显示 vault 统计]

在以下位置找到 vault：~/Library/Mobile Documents/iCloud~md~obsidian/Documents/MyVault
📊 Vault 统计：1,248 个 markdown 文件，总共 523MB

你想导入此 vault 吗？（是/跳过）

**在 Linux/Windows 上：** 请输入现有 Obsidian vault 的路径，或输入 'skip' 从头开始：（例如：~/Documents/MyVault 或 /home/user/obsidian-vault）

User: ~/Documents/MyVault

[验证路径并显示 vault 统计]

在以下位置找到 vault：~/Documents/MyVault
📊 Vault 统计：1,248 个 markdown 文件，总共 523MB

你想导入此 vault 吗？（是/跳过）

📦 **分析你的 vault 结构...**
[运行 tree 查看文件夹层次结构]
[抽样笔记了解内容]
[从最近的文件检测命名模式]

我可以看到你正在使用：

- 修改的 PARA 结构，带有自定义文件夹
- 每日笔记的日期前缀文件（YYYY-MM-DD）
- 带有嵌套研究的项目文件夹
- 大量使用资源文件夹存储参考资料

📦 **导入你的 vault...**
[将文件复制到 OLD_VAULT/]
[保留 .obsidian 设置]
[检查插件文件夹]

✅ 已导入 2,517 个文件（1.1GB）到 OLD_VAULT/
你的原始结构完全保留！

现在让我们个性化你的设置：

1. **你叫什么名字？**

   _为何询问：_ 我将使用它来个性化你的 CLAUDE.md 文件，并帮助我更好地理解你的背景。这创造了更量身定制的体验，我可以自然地引用你的工作和兴趣。

User: Noah Brier

2. **你希望我研究你的公开作品吗？**

   _为何有帮助：_ 通过了解你的背景、专业知识和兴趣，我可以：
   - 为你的特定领域和工作流程定制建议
   - 引用你领域中的相关示例
   - 更好地理解你问题的背景
   - 建立帮助我成为更有效思考伙伴的个人资料

User: 是

太好了！为了确保我找到真正的你，你能提供以下任何详细信息吗？

- 你的公司或组织
- 你的位置（城市/国家）
- 你处理过的独特项目
- 你的网站或社交媒体账号
- 任何其他识别信息

这有助于避免与其他同名的人混淆。

User: 我联合创立了 Variance 和 Percolate，我在 every.to 写作

太好了！让我用这些详细信息搜索你...

[使用提供的识别信息搜索]

根据你的详细信息，我找到了你 - Noah Brier，Variance 和 Percolate 的联合创始人，every.to 的作家。

让我确认这是正确的：

- 联合创立了 Variance（开发者工具）和 Percolate（营销软件）
- 在 every.to 和 Why Is This Interesting? 简报写作
- 专注于系统思维、创造力和技术

这是你吗？（是/否）

User: 是

太好了！我已经识别了正确的个人资料。

**建立你的个人资料**
你希望我阅读任何特定页面以更好地了解你的工作吗？

- 你的个人网站或博客
- 你最近的论文或文章
- 公司/项目页面
- LinkedIn 或其他个人资料

输入 URL（逗号分隔）或 'skip' 继续：

User: https://whyisthisinteresting.com/about, https://every.to/@noahbrier

[获取并分析提供的 URL]

我已经建立了全面的个人资料：

- 你联合创立了 Variance（开发者工具）和 Percolate（营销软件）
- 你与 Colin Nagy 一起撰写 Why Is This Interesting? 简报
- 你探索创造力、技术和系统思维
- 你写过关于作为思考的写作、笔记系统和 AI

还有什么关于你的工作或兴趣我应该知道的吗？

User: 我真的很感兴趣 AI 如何增强思考，而不仅仅是写作

明白了！我会记住你专注于 AI 作为思考工具，而不仅仅是写作助手。

3. **你将主要使用此 vault 用于什么？**（研究、写作、项目管理、每日笔记、知识库或组合？）

User: 我将把它用于研究、写作以及管理客户项目

Assistant: 太好了！我将为研究、写作和客户项目管理配置你的 vault。

4. **你当前正在处理哪些具体项目？**（我将在 10_Projects 中为每个创建文件夹）

User: 我正在写一本关于生产力系统的书，构建一个 SaaS 应用，并规划会议演讲

Assistant: 完美！我将设置项目文件夹：

- 10_Projects/书 - 生产力系统/
- 10_Projects/SaaS 应用开发/
- 10_Projects/会议演讲/

5. **你维护哪些持续的责任领域？**（这些进入 20_Areas - 没有结束日期的事项）

User: 我的简报、健康与健身、个人财务和家庭活动

Assistant: 我将创建领域文件夹：

- 20_Areas/简报/
- 20_Areas/健康与健身/
- 20_Areas/财务/
- 20_Areas/家庭/

6. **你经常研究或引用哪些主题？**（我将在 30_Resources 中组织这些）

User: AI 工具、生产力方法、SaaS 指标和写作技巧

Assistant: 设置资源文件夹：

- 30_Resources/AI 工具/
- 30_Resources/生产力方法/
- 30_Resources/SaaS 指标/
- 30_Resources/写作技巧/

[继续问题...]

**Gemini Vision 设置**
Gemini Vision 已包含在 claudesidian 中！
它可以分析你 vault 中的图片、PDF 和视频。
要激活它，你只需要一个免费的 Google API 密钥（需要 30 秒）。
你想现在设置吗？（是/否/稍后）

User: 稍后

没问题！你可以在准备好时随时运行 `/setup-gemini` 设置。

**Firecrawl 设置**
Firecrawl 是研究的游戏规则改变者！
将任何文章或网站直接保存为 markdown 到你的 vault。
非常适合构建永久、可搜索的研究库。
你想设置它吗？（是/否/稍后）

User: 是

太好了！Firecrawl 将改变你收集研究的方式。

Assistant: 太好了！以下是获取 API 密钥的方法：

1. 访问 https://aistudio.google.com/apikey
2. 点击"创建 API 密钥"
3. 复制密钥（以 AIzaSy... 开头）

一旦你有了它，在这里粘贴，我会为你配置一切。
