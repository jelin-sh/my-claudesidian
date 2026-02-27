# 变更日志（Changelog）

## 关于此项目

**My-Claudesidian** 是 [Claudesidian](https://github.com/heyitsnoah/claudesidian) 的个人化中文化版本。

- **继承版本**：heyitsnoah/claudesidian v0.14.2
- **分支日期**：2026-02-27
- **主要变更**：中文化、目录编号调整、移除 MCP 服务器

本项目的版本号从 0.1.0 重新开始计数，以区分于原始仓库。

---

所有重要更改都将记录在此文件中。

格式基于 [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)，
本项目遵循 [语义版本控制](https://semver.org/spec/v2.0.0.html)。

## [Unreleased]

## [0.2.0] - 2026-02-28

### Changed

- **README 美化**：为各章节添加 emoji，增强可读性

### Removed

- **Node.js 依赖**：完全移除 package.json 和相关脚本
- **Firecrawl 集成**：删除 Firecrawl 相关命令和配置
- **升级系统**：删除 `/upgrade` 和 `/release` 命令
  - 这些命令依赖 package.json 进行版本管理
  - 项目简化为纯静态配置，不再需要版本管理系统

## [0.1.0] - 2026-02-27

### 初始版本 - 基于 heyitsnoah/claudesidian v0.14.2

这是 My-Claudesidian 的第一个发布版本，从 Claudesidian v0.14.2 分支并进行个人化改造。

#### Changed

- **仓库改造**：中文化 - 文档、说明、操作指南（专业术语保留英文）
- **目录编号**：01-06 系列改为 10-60 系列（00_Inbox 保持不变）
  - `01_Projects` → `10_Projects`
  - `02_Areas` → `20_Areas`
  - `03_Resources` → `30_Resources`
  - `04_Archive` → `40_Archive`
  - `05_Attachments` → `50_Attachments`
  - `06_Metadata` → `60_Metadata`
- **仓库信息**：
  - 名称：`my-claudesidian`
  - 作者：`jelin-sh`
  - 远程地址：`https://github.com/jelin-sh/my-claudesidian`
- **配置同步**：所有脚本和配置文件中的目录路径已更新

#### Removed

- 删除 `.claude/mcp-servers/` 目录（Gemini Vision MCP 服务器）
- 从 `package.json` 中移除以下依赖：
  - `@google/generative-ai`
  - `@modelcontextprotocol/sdk`
- 移除 `package.json` 中的 `test-gemini` 脚本

#### Added

- 中文化所有 PARA 文件夹的 README.md
- 中文化模板文件（Daily Note、Project、Research Note）
- 更新 SessionStart 钩子欢迎消息为中文
- 中文化主文档：
  - README.md
  - CLAUDE.md
  - CLAUDE-BOOTSTRAP.md
  - CONTRIBUTING.md

#### Kept Unchanged

- `.claude/skills/` 目录保持原样（技能文件保持英文）
- 核心命令系统保持不变
- PARA 方法组织结构保持不变

---

## 原始 Claudesidian 版本历史

以下是从原始 [heyitsnoah/claudesidian](https://github.com/heyitsnoah/claudesidian/blob/main/CHANGELOG.md) 继承的版本历史，仅供参考：

### v0.14.2 (2026-01-13)

- 更新 `@modelcontextprotocol/sdk` 到 v1.25.2（修复安全漏洞）
- 更新开发依赖到最新版本
- 为 kepano/obsidian-skills 添加 MIT 许可证归属

### v0.14.0 (2026-01-13)

- 新增 `.claude/skills/` 自动触发技能系统
- 新增 `/pragmatic-review` 代码审查命令

### v0.13.0 (2025-01-17)

- 新增 `/install-claudesidian-command` 快速启动命令
- iCloud Drive vault 检测和导入支持（macOS）

### v0.12.0 (2025-01-17)

- 新增 `/download-attachment` 命令
- 新增 `/pull-request` 命令

### v0.10.0 (2025-01-15)

- GitHub Actions 工作流集成

### v0.3.0 (2025-01-13)

- 智能升级命令（`/upgrade`）

### v0.1.0 (2025-01-13)

- Claudesidian 初始发布

完整版本历史请参阅：https://github.com/heyitsnoah/claudesidian/blob/main/CHANGELOG.md
