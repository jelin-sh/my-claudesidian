---
allowed-tools: Write, Read, Bash(ls:*, mkdir:*), Edit
description: Create a new Claude Code slash command
argument-hint: [command details or description]
---

# Create New Slash Command

I'll help you create a new Claude Code slash command.

## Your Input

**Command Details:** $ARGUMENTS

## Process

1. **Understand Requirements**
   - What should the command do?
   - What tools does it need?
   - What output should it produce?

2. **Design Structure**
   - Command name (kebab-case)
   - Required tools
   - Input arguments
   - Output format

3. **Create Command File**
   - Location: `.claude/commands/[command-name].md`
   - Include proper frontmatter
   - Clear instructions
   - Example usage

## Command Template

```markdown
---
allowed-tools: [List tools needed: Read, Write, Edit, Bash, etc.]
description: [One-line description]
argument-hint: [What user should provide]
---

# Command Name

Brief description of what this command does.

## Task

[Clear description of the task]

## Process

1. [Step 1]
2. [Step 2]
3. [Step 3]

## Output

[Expected output format]

## Example Usage

\`\`\` claude run [command-name] [arguments] \`\`\`
```

## 最佳实践

- 保持命令专注于单一任务
- 使用清晰、描述性的名称
- 包含使用示例
- 记录所需的参数
- 指定输出格式
- 在 frontmatter 中列出所需的工具

让我帮你创建你的命令！
