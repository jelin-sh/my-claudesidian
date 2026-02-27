---
name: release
description:
  Automatically bump version, update changelog, commit, tag, and push a new
  release based on recent changes
allowed-tools: [Read, Write, Edit, MultiEdit, Bash, Grep]
argument-hint:
  "(optional) 'major', 'minor', 'patch', or leave blank for auto-detection"
---

# 发布命令

自动化整个发布流程：分析最近的提交以确定版本提升类型，更新 package.json 中的版本，将未发布的 changelog 条目移动到新版本，提交所有内容，创建 git 标签，并推送到 GitHub。

## 任务

1. 分析自上次标记以来的提交以确定版本提升类型
2. 更新 package.json 中的版本
3. 将 CHANGELOG.md 中的"未发布"条目移动到新版本部分
4. 提交更改
5. 创建带注释的 git 标签
6. 推送到 GitHub

## 流程

1. **检查先决条件**
   - 确保在 main/master 分支上
   - 检查未提交的更改
   - 验证 CHANGELOG.md 和 package.json 存在
   - 从 package.json 获取当前版本

2. **确定版本提升**
   - 如果提供了参数（major/minor/patch），使用该参数
   - 否则，分析自上次标记以来的提交：
     - 查找 "BREAKING CHANGE" 或 "!" = major 提升
     - 查找 "feat:" = minor 提升
     - 查找 "fix:"、"docs:"、"chore:" = patch 提升
   - 计算新版本号

3. **更新文件**
   - 更新 package.json 中的版本
   - 将 CHANGELOG.md 中的"未发布"部分移动到新版本部分
   - 为新版本添加比较链接
   - 创建新的空"未发布"部分

4. **Git 操作**
   - 暂存更改：`git add package.json CHANGELOG.md`
   - 提交：`git commit -m "chore: release v{version}"`
   - 创建带注释的标记：`git tag -a v{version} -m "Release v{version}"`
   - 推送提交：`git push`
   - 推送标签：`git push --tags`

5. **创建 GitHub 发布**
   - 使用 `gh release create` 自动发布发布
   - 从 CHANGELOG.md 提取版本部分以获取发布说明
   - 包含"Generated with Claude Code"页脚
   - 这确保发布在 GitHub 的发布页面中可见

6. **提供确认**
   - 显示 GitHub 发布 URL
   - 确认成功发布

## 版本提升规则

### 语义版本控制（MAJOR.MINOR.PATCH）

**快速决策指南：**

- 用户可以做以前做不到的事吗？→ **MINOR**
- 以前工作的东西坏了吗？→ **MAJOR**（如果破坏）或 **PATCH**（如果在修复）
- 以前工作的东西变好了吗？→ **PATCH**

**MAJOR**（1.0.0 → 2.0.0）：

- 需要用户更改其代码/配置的破坏性更改
- 移除功能或命令
- 以不兼容的方式更改命令语法或行为
- 正文中有 "BREAKING CHANGE" 的提交
- 类型后有 "!" 的提交（例如，"feat!:"）

**MINOR**（1.0.0 → 1.1.0）：

- **新添加的功能**（而不是现有功能的增强）
- 使以前不可能的事情成为可能
- 新命令、新工具、新集成
- 不影响现有功能的新可选功能
- 启用新功能的重要架构更改
- 以 "feat:" 开头并添加**新**功能的提交
- 示例：
  - 添加新的 `/command`
  - 添加新的 MCP 服务器
  - 添加 vault 导入功能（首次）
  - 使升级在没有 git 连接的情况下工作（以前不可能）
  - 启用功能在以前需要互联网时离线工作

**PATCH**（1.0.0 → 1.0.1）：

- 错误修复和小改进
- 对现有功能的增强（已经工作的）
- 性能改进
- 文档更新
- 不改变行为的重构
- 带有 "fix:"、"docs:"、"style:"、"refactor:"、"perf:"、"test:"、"chore:" 的提交
- 示例：
  - 使现有命令更智能（但不启用新用例）
  - 改进错误消息
  - 修复现有功能中的错误
  - 增强现有导入以更智能
  - 改进现有功能的 UI/格式

### 提交消息最佳实践

**"feat:" 仅用于新功能：**

- ✅ `feat: 添加 vault 导入功能`
- ❌ `feat: 增强 vault 导入`（应该是 `fix:` 或 `refactor:`）

**"fix:" 用于改进和更正：**

- ✅ `fix: 改进 vault 检测准确性`
- ✅ `fix: 更正 init-bootstrap 中的文件计数`

**"refactor:" 用于代码改进：**

- ✅ `refactor: 通过 URL 获取增强配置文件构建`
- ✅ `refactor: 使 init-bootstrap 问题更智能`

**"perf:" 用于性能改进：**

- ✅ `perf: 优化大型 vault 的 vault 分析`

## 使用示例

```bash
# 从提交自动检测版本提升
claude run release

# 强制特定版本提升
claude run release patch
claude run release minor
claude run release major

# 示例输出：
# 📦 当前版本：0.1.0
# 🔍 分析自上次发布以来的提交...
#
# 找到的提交：
# - feat: 为 Gemini Vision 添加视频支持
# - docs: 使用设置说明更新 README
# - fix: 更正附件链接处理
#
# ✨ 检测到版本提升：MINOR（添加了新功能）
# 📝 新版本：0.2.0
#
# ✅ 已更新 package.json
# ✅ 已更新 CHANGELOG.md
# ✅ 已提交更改
# ✅ 已创建标签 v0.2.0
# ✅ 推送到 GitHub
# ✅ 已创建 GitHub 发布
#
# 🎉 发布 v0.2.0 完成！
#
# GitHub 发布：https://github.com/user/repo/releases/tag/v0.2.0
```

## 错误处理

- 如果不在 main 分支上："请先切换到 main 分支"
- 如果有未提交的更改："请先提交或暂存更改"
- 如果自上次发布以来没有更改："没有更改可以发布"
- 如果版本已存在："版本 X.X.X 已存在"

## 安全功能

- 空运行模式：显示将要发生的事情而不进行更改
- 推送前的确认提示
- 验证版本格式
- 创建前检查现有标签
