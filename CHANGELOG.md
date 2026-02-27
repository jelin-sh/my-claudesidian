# 变更日志（Changelog）

my-claudesidian 的所有重要更改都将记录在此文件中。

格式基于 [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)，
本项目遵循 [语义版本控制](https://semver.org/spec/v2.0.0.html)。

## [Unreleased]

## [0.14.3] - 2026-02-27

### Changed

- **仓库改造**：中文化 - 文档、说明、操作指南（专业术语保留英文）
- **目录编号**：01-06 系列改为 10-60 系列（00_Inbox 保持不变）
- **仓库信息**：更新名称为 my-claudesidian，远程地址改为 jelin-sh/my-claudesidian
- **配置同步**：所有脚本和配置文件中的目录路径已更新

### Removed

- 删除 `.claude/mcp-servers/` 目录及相关依赖（@google/generative-ai、@modelcontextprotocol/sdk）
- 移除 package.json 中的 test-gemini 脚本

### Added

- 中文化所有 PARA 文件夹的 README.md
- 中文化模板文件（Daily Note、Project、Research Note）
- 更新 SessionStart 钩子欢迎消息为中文

## [0.14.2] - 2026-01-13

### Changed

- 更新 `@modelcontextprotocol/sdk` 到 v1.25.2（修复 HIGH 严重性 ReDoS 和 DNS 重新绑定漏洞）
- 更新开发依赖（eslint、prettier、typescript-eslint）到最新版本

### Added

- 为 kepano/obsidian-skills（json-canvas、obsidian-bases、obsidian-markdown）添加 MIT 许可证归属
- 添加 `.worktrees/` 到 gitignore 以支持 git worktree 工作流

### Security

- 修复了 5 个 Dependabot 安全警报（3 个高严重性，2 个中等）

## [0.14.1] - 2026-01-13

### Fixed

- 在 `firecrawl-batch.sh` 的文件名清理中保留 CJK（中日韩）字符
- 在 `/upgrade` 命令中将 sed 替换为 cut 以实现 zsh 兼容性

## [0.14.0] - 2026-01-13

### Added

- 新的 `.claude/skills/` 目录，具有自动触发的技能系统
  - `obsidian-markdown` - Obsidian Flavored Markdown 参考（wikilinks、callouts、embeds）
  - `obsidian-bases` - .base 文件创建和编辑指南
  - `json-canvas` - .canvas 文件创建和编辑指南
  - `systematic-debugging` - 4 阶段调试方法论
  - `skill-creator` - 创建新技能和命令的指南
  - `git-worktrees` - Git worktree 工作流指南
- 新的 `/pragmatic-review` 命令，专注于 YAGNI/KISS 代码审查
  - 默认模式：快速扫描过度工程化
  - 深度模式 (--deep)：6 遍综合审查
  - CI 模式 (--ci)：GitHub Actions 的非交互式
- 当用户提到"skill"时列出可用技能的技能发现钩子
- 更新 `.prettierignore` 以排除 markdown 文件

## [0.13.1] - 2025-10-13

### Fixed

- 修正硬编码文件夹路径以使用下划线而不是空格
  - 修复 `transcript-extract.sh`：`00 Inbox/Clippings` → `00_Inbox/Clippings/`
  - 修复 `firecrawl-batch.sh`：`00 Inbox/Clippings` → `00_Inbox/Clippings/`
  - 修复 `update-attachment-links.js`：`05 Attachments` → `05_Attachments`
  - 修复 `fix-renamed-links.js`：`05 Attachments` → `05_Attachments`
  - 修复 `GEMINI_VISION_QUICK_START.md` 中的示例路径
- 通过消除 `source ~/.zshrc` 删除 `firecrawl-batch.sh` 中的安全风险
- 修正 Gemini Vision 文档中不存在的文件引用

### Added

- 为 `firecrawl-batch.sh` 添加自定义输出目录标志（`-o|--output-dir`）
- 在 README.md 中添加新输出目录选项的文档

## [0.13.0] - 2025-01-17

### Added

- 新的 `/install-claudesidian-command` 用于创建 shell 别名/函数，从任何位置启动 vault
- 在 `/init-bootstrap` 中的 iCloud Drive vault 检测和导入支持（仅 macOS）
- 使用适当的函数语法为启动器命令添加 Fish shell 支持
- 全面的用户输入路径验证，提供有用的错误消息
- 用于跨平台兼容性的平台检测（Linux、macOS、Windows）

### Fixed

- 通过适当的路径转正修复启动器命令中的关键 shell 注入漏洞
- 修改 shell 配置文件之前创建备份
- 使用软警告进行 iCloud 同步状态检查，以处理不完整的下载
- Shell 检测现在使用默认 shell 而不是当前会话 shell
- 使用用户确认替换现有别名/函数
- 改进了错误处理文档和说明

### Security

- 对包含空格、引号和特殊字符的 vault 路径进行路径转义
- 修改 shell 配置之前的时间戳备份
- 用户提供的 vault 路径的输入验证
- 文档中的安全考虑部分

## [0.12.1] - 2025-01-17

### Fixed

- 改进了升级命令以防止交互式提示和挂起
- 使用显式备份步骤和非交互式文件替换增强升级命令
- 根据实际使用反馈改进升级命令以提高可靠性
- 应用 linting 修复以升级命令的代码质量

## [0.12.0] - 2025-01-17

### Added

- 新的 `/download-attachment` 命令，用于将网页内容和文件下载到 Obsidian 附件文件夹
- 新的 `/pull-request` 命令，用于创建具有智能更改分析和描述生成的 PR
- 两个命令都与 Obsidian 的 vault 结构无缝集成

### Fixed

- 根据 PR 审查反馈改进下载命令的安全性
- 代码格式化以通过 lint 检查

## [0.11.0] - 2025-01-17

### Added

- 使用 ESLint 和 Prettier 的全面 linting 和格式化设置
- 配置文件组织在 `.config/` 文件夹中，以获得更好的项目结构
- GitHub Action 工作流，用于在 pull request 上自动进行 lint 检查
- 包管理器规范，以实现一致的依赖管理

### Fixed

- 解决了 lonely if ESLint 警告，以获得更清洁的代码
- 适当的 pnpm 设置的 GitHub Action 配置
- 添加 packageManager 字段以确保跨环境的一致工具

## [0.10.1] - 2025-01-15

### Fixed

- 修正 GitHub Action 配置以使用 claude_args 而不是 allowed_tools
- 修复 allowed tools 参数的工作流验证错误

## [0.10.0] - 2025-01-15

### Added

- 用于 Claude Code 集成的 GitHub Actions 工作流
- Claude 现在可以响应 issues 和 PR 中的 @claude 提及
- 为 Claude 配置权限以创建 PR 和推送更改
- 添加了 pnpm、git、gh CLI 操作的允许工具配置
- 安全性的仓库所有者用户限制
- init-bootstrap 中的开发工作流选项
  - 个人 vault 用户：删除 .github 文件夹
  - 贡献者：保留 GitHub 工作流用于开发

## [0.9.2] - 2025-01-14

### Fixed

- 修正 Firecrawl 脚本示例以使用 `npm run` 命令
- 添加了关于在提交前审查 AI 生成内容的贡献指南

### Removed

- 从 README 中删除了通用模式部分（冗余）

## [0.9.1] - 2025-01-14

### Changed

- 增强了 Gemini Vision 文档，以解释直接图像/PDF 处理的好处
- 增强了 Firecrawl 文档，以解释全文捕获和上下文保留
- 为 Gemini 和 Firecrawl 添加了详细的 API 密钥设置说明

### Removed

- 从 README 中删除了基本工作流部分（与命令描述冗余）

## [0.9.0] - 2025-01-14

### Added

- 增强了升级命令文档，包含详细的使用示例和安全功能
- 包含社区贡献指南的贡献部分
- MIT 许可证文件，用于明确的开源许可

### Changed

- 改进了 Claude Code 命令与代理区别的文档清晰度
- 更新了贡献指南，鼓励为命令、代理和核心功能提交 PR

### Removed

- 删除了 thinking-partner 代理（仅保留斜杠命令）

## [0.8.8] - 2025-01-13

### Fixed

- 为升级命令文档添加了关键警告
- 强调在应用更改之前显示差异的要求
- 添加了正确与错误实现示例
- 防止升级期间丢失用户自定义

## [0.8.7] - 2025-01-13

### Fixed

- Release 命令现在使用 gh CLI 自动创建 GitHub release
- 防止丢失 GitHub release（如 v0.8.2-v0.8.5）
- 从 CHANGELOG.md 提取 release 说明用于 GitHub release 正文

## [0.8.6] - 2025-01-13

### Changed

- 改进了 release 命令中的语义版本控制指南，具有更清晰的决策指南

## [0.8.5] - 2025-01-13

### Fixed

- 升级命令现在可以在没有 git 连接的情况下为断开连接的用户工作
- 将最新版本克隆到 .tmp/ 目录，而不是要求上游远程
- 使用 .tmp/ 而不是 /tmp/ 来对 Obsidian 隐藏升级文件
- 检测到本地修改时添加用户选择提示
- 添加验证步骤以确保所有文件都得到正确处理
- 添加 .tmp/ 到 .gitignore 以获得更清洁的仓库

## [0.8.4] - 2025-01-13

### Fixed

- 简化了升级命令，以系统检查所有系统文件
- 创建升级清单以逐文件跟踪进度
- 将升级过滤为仅 claudesidian 系统文件，而不是用户内容
- 更新之前添加显式的逐文件差异审查
- 使用清单跟踪使升级过程可恢复

## [0.8.3] - 2025-01-13

### Fixed

- 改进了多个 vault 的 init-bootstrap vault 选择
- 导入任何 vault 之前添加显式确认
- 使用更好的说明增强用户识别提示
- 添加消除歧义提示，以便在研究时找到合适的人
- 明确的指示，在没有明确的 vault 确认的情况下永远不要继续

## [0.8.2] - 2025-01-13

### Fixed

- 改进了 SessionStart 钩子格式，使用箭头指示命令
- 修复了更新通知显示，以显示清洁的输出而不是原始 JSON
- 增强了首次运行和更新消息的视觉布局

## [0.8.1] - 2025-01-13

### Changed

- 使用全面的功能描述更新了 README，包括：
  - 智能 vault 分析和模式检测功能
  - 用户研究和配置文件构建功能
  - 自动更新通知系统
  - 使用 Firecrawl 的网络研究功能
  - 包括 /upgrade 在内的可用命令的完整列表

## [0.8.0] - 2025-01-13

### Added

- 会话开始时自动检查更新
- 从 GitHub 获取最新版本并与本地的 SessionStart 钩子进行比较
- 有新版本可用时的更新通知
- 用于版本比较的 check-updates npm 脚本
- 即使从原始仓库断开连接也能工作

### Changed

- 使用更清晰的语义版本控制指南增强了 release 命令文档
- 关于在提交中何时使用 feat: vs fix: vs refactor: 的更好指导

## [0.7.0] - 2025-01-13

### Added

- 使用 tree、笔记采样和模式检测的全面 vault 分析
- 使用 URL 获取和自定义上下文增强的配置文件构建
- CLAUDE.md 中时间戳的动态日期生成
- Gemini Vision 和 Firecrawl 设置的"稍后"选项
- 多个 vault 导入选项（是/否/跳过/路径）
- 使用消除歧义确认的更深入的研究功能

### Changed

- init-bootstrap 现在在导入之前分析 vault 结构
- 即使有单个搜索结果也始终确认用户身份
- 等到选择组织方法后再创建文件夹
- 自动检测插件和附件，而不是询问
- Firecrawl 作为具有更好说明的研究变革者呈现
- 配置文件构建包括来自提供的 URL 的全面背景

### Fixed

- 没有深度限制的正确文件计数
- 导入在个性化问题之前的正确排序
- 从现有 vault 更准确地检测用户偏好

## [0.6.0] - 2025-01-13

### Added

- 智能 vault 导入，在 OLD_VAULT 文件夹中保留现有结构
- 通过搜索 .obsidian 文件夹自动检测现有 Obsidian vaults
- 用于个性化设置的用户研究和消除歧义
- 文件命名模式和文件夹组织的自动检测
- Vault 配置保存到 .claude/vault-config.json 供将来参考
- 每个设置步骤的教育说明
- 支持 pnpm 和 npm 包管理器
- 全面的 Obsidian 文件复制（插件、trash、settings）
- 克隆仓库时文件夹命名的清晰示例

### Changed

- init-bootstrap 现在安全地导入整个 vault 结构而不会丢失数据
- Gemini Vision 和 Firecrawl 提示澄清工具已包含
- README 包含克隆时自定义文件夹名称的示例
- 通过自动检测模式删除不必要的问题

## [0.5.0] - 2025-01-13

### Added

- 使用 SessionStart 钩子的首次运行欢迎消息
- FIRST_RUN 标记文件以检测全新安装
- Markdown 格式的欢迎提示和设置说明
- 新用户的自动检测和指导

### Changed

- init-bootstrap 现在在设置完成后删除 FIRST_RUN 标记
- 钩子配置使用内联命令（不需要外部脚本）

## [0.4.0] - 2025-01-13

### Added

- 简化的设置过程，具有增强的 init-bootstrap 命令：
  - 自动从原始仓库断开连接
  - 非 git 用户的文件夹重命名帮助
  - 支持 git clone 和 ZIP 下载方法
  - 导入现有 Obsidian vaults 的清晰提示
- README 中针对不同用户技能级别的多条设置路径

### Changed

- init-bootstrap 现在处理完整的环境设置，包括 git 管理
- README 更新了技术和非技术用户的更清晰的快速入门说明

## [0.3.1] - 2025-01-13

### Fixed

- 从仓库跟踪中删除 CLAUDE.md 和 settings.local.json
- 这些用户特定的文件现在由 init-bootstrap 本地生成
- 将两个文件都添加到 .gitignore 以防止意外提交
- 为新用户提供清洁的仓库结构

## [0.3.0] - 2025-01-13

### Added

- 智能升级命令（`/upgrade`），具有 AI 驱动的语义合并
- 在添加新功能时保留用户自定义的智能冲突解决
- 具有回滚功能的自动备份系统
- 选择性更新类别（AI 可合并、自动安全、受保护）
- 基于 2025 年 LLM 驱动代码迁移最佳实践

## [0.2.3] - 2025-01-13

### Changed

- 更新了 init-bootstrap 命令和设置配置

## [0.2.2] - 2025-01-13

### Fixed

- 修正所有文档以使用正确的斜杠命令语法（/command-name）
- 修复显示错误的 'claude run' 语法的示例
- 更新了 README、CLAUDE.md、install.sh 和命令文档

## [0.2.1] - 2025-01-13

### Changed

- 更新 README 以使用 init-bootstrap 命令而不是 install.sh
- 将快速入门说明简化为 2 步流程
- 在 README 中添加了预配置命令的示例

## [0.2.0] - 2025-01-13

### Added

- 用于自动化版本管理和发布的 Release 命令
- Gemini Vision 视频分析支持：
  - 本地视频文件（MP4、AVI、MOV、WebM、MKV、WMV、FLV、3GP、M4V）
  - 直接 YouTube URL 分析而无需下载
  - 自动视频处理状态检测
- 使用视频分析示例更新的文档

### Changed

- 使用完整环境设置（包括 MCP 配置）增强了 init-bootstrap 命令
- 更新了 Gemini Vision MCP 服务器以支持视频格式

## [0.1.0] - 2025-01-13

### Added

- claudesidian 的初始发布 - Claude Code + Obsidian 入门套件
- PARA 方法文件夹结构（00_Inbox 到 06_Metadata）
- 通过 `claude run init-bootstrap` 的 Bootstrap 初始化系统
- 预配置的 Claude Code 命令：
  - thinking-partner - 协作思考模式
  - inbox-processor - 整理捕捉内容
  - research-assistant - 深入探讨主题
  - daily-review - 一天结束时的反思
  - weekly-synthesis - 在一周中找到模式
  - create-command - 构建新的自定义命令
  - de-ai-ify - 删除 AI 写作模式
  - add-frontmatter - 向笔记添加元数据
  - init-bootstrap - 交互式设置向导
- 用于专业工作流的 Claude Code 代理
- 辅助脚本：
  - firecrawl-batch.sh - 批量网页爬取
  - firecrawl-scrape.sh - 单个 URL 爬取
  - fix-renamed-links.js - 重命名后修复断开的链接
  - update-attachment-links.js - 更新附件引用
  - transcript-extract.sh - 提取 YouTube 字幕
  - vault-stats.sh - 显示 vault 统计信息
- 通过 pnpm 的附件管理命令
- 用于图像/PDF 分析的 Gemini Vision MCP 服务器（可选）
- CLAUDE-BOOTSTRAP.md 模板用于配置
- 包含设置说明的全面 README
- 用于自动化设置的安装脚本
- 具有适当 .gitignore 的 Git 集成

### Changed

- 用动态 init-bootstrap 命令替换了静态 CLAUDE.md

### Security

- API 密钥存储在环境变量中
- .mcp.json 被 gitignore 以确保安全

[Unreleased]: https://github.com/jelin-sh/my-claudesidian/compare/v0.14.2...HEAD
[0.14.3]: https://github.com/jelin-sh/my-claudesidian/compare/v0.14.2...v0.14.3
[0.14.2]: https://github.com/jelin-sh/my-claudesidian/compare/v0.14.1...v0.14.2
[0.14.1]: https://github.com/jelin-sh/my-claudesidian/compare/v0.14.0...v0.14.1
[0.14.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.13.1...v0.14.0
[0.13.1]: https://github.com/jelin-sh/my-claudesidian/compare/v0.13.0...v0.13.1
[0.13.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.12.1...v0.13.0
[0.12.1]: https://github.com/jelin-sh/my-claudesidian/compare/v0.12.0...v0.12.1
[0.12.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.11.0...v0.12.0
[0.11.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.10.1...v0.11.0
[0.10.1]: https://github.com/jelin-sh/my-claudesidian/compare/v0.10.0...v0.10.1
[0.10.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.9.2...v0.10.0
[0.9.2]: https://github.com/jelin-sh/my-claudesidian/compare/v0.9.1...v0.9.2
[0.9.1]: https://github.com/jelin-sh/my-claudesidian/compare/v0.9.0...v0.9.1
[0.9.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.8.8...v0.9.0
[0.8.8]: https://github.com/jelin-sh/my-claudesidian/compare/v0.8.7...v0.8.8
[0.8.7]: https://github.com/jelin-sh/my-claudesidian/compare/v0.8.6...v0.8.7
[0.8.6]: https://github.com/jelin-sh/my-claudesidian/compare/v0.8.5...v0.8.6
[0.8.5]: https://github.com/jelin-sh/my-claudesidian/compare/v0.8.4...v0.8.5
[0.8.4]: https://github.com/jelin-sh/my-claudesidian/compare/v0.8.3...v0.8.4
[0.8.3]: https://github.com/jelin-sh/my-claudesidian/compare/v0.8.2...v0.8.3
[0.8.2]: https://github.com/jelin-sh/my-claudesidian/compare/v0.8.1...v0.8.2
[0.8.1]: https://github.com/jelin-sh/my-claudesidian/compare/v0.8.0...v0.8.1
[0.8.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.3.1...v0.4.0
[0.3.1]: https://github.com/jelin-sh/my-claudesidian/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.2.3...v0.3.0
[0.2.3]: https://github.com/jelin-sh/my-claudesidian/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/jelin-sh/my-claudesidian/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/jelin-sh/my-claudesidian/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/jelin-sh/my-claudesidian/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/heyitsnoah/claudesidian/releases/tag/v0.1.0
