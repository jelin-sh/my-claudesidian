# Claude Code 命令

预配置的命令，用于增强你的 Claude Code + Obsidian 工作流。

## 可用命令

### 🤔 thinking-partner

让 Claude 成为你的思考伙伴，共同探索复杂问题。

```
/thinking-partner
```

最适合：头脑风暴、问题探索、发展想法

### 📥 inbox-processor

处理和组织收件箱文件夹中的项目。

```
/inbox-processor
```

最适合：每周收件箱清理、整理捕捉的内容

### 🔍 research-assistant

使用你的 vault 对任何主题进行深入研究。

```
/research-assistant
```

最适合：深度挖掘、文献综述、知识综合

### 📅 daily-review

每日回顾，捕捉进展并规划明天。

```
/daily-review
```

最适合：每日结束仪式、反思

### 📊 weekly-synthesis

创建一周工作的综合总结。

```
/weekly-synthesis
```

最适合：每周回顾、模式识别

## 创建自定义命令

1. 在此目录中创建新的 `.md` 文件
2. 使用描述性名称（kebab-case 格式）
3. 按以下结构组织：
   - 清晰的角色定义
   - 具体的流程步骤
   - 预期的输出格式
   - 提示和约束

## 使用命令

### 方法 1：直接调用（在 Claude Code 中）

```
/[command-name]
```

### 方法 2：在聊天中引用

```
Use the thinking-partner command to help me explore [topic]
```

### 方法 3：手动执行

```
Follow the instructions in .claude/commands/[command].md
```

## 提示

- 命令本质上是结构化的提示词
- 根据你的需求进行修改
- 组合命令以处理复杂工作流
- 与社区分享你的自定义命令

## 命令创意

考虑为以下场景创建命令：

- 项目回顾
- 会议笔记处理
- 书籍笔记提取
- 想法发展
- 内容规划
- 学习路径创建
- 决策分析

记住：最好的命令来自你的实际工作流程。
