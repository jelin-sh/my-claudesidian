# 📎 附件（Attachments）

图像、PDF 和其他非文本文件的存储。

## 用途

以下内容的集中位置：
- 图像和截图
- PDF 和文档
- 电子表格和数据文件
- 音频和视频文件
- 笔记中引用的任何二进制文件

## 组织

```
50_Attachments/
├── Organized/          # 已处理且有良好名称的文件
│   ├── Images/
│   ├── PDFs/
│   └── Data/
├── IMG_*.png          # 未处理的手机图像
├── Screenshot*.png    # 未处理的截图
├── CleanShot*.png    # 未处理的 CleanShot 文件
└── *.pdf             # 各种 PDF
```

## 命名约定

### 处理前
- `IMG_1234.png`（来自手机）
- `Screenshot 2024-03-15 at 2.30.45 PM.png`
- `CleanShot 2024-03-15 at 14.30.45.png`
- `document(1).pdf`

### 处理后
- `2024-03-15_Project_Architecture_Diagram.png`
- `2024-03-15_Meeting_Whiteboard.jpg`
- `API_Documentation_v2.pdf`
- `Customer_Interview_Transcript.pdf`

## 辅助脚本

使用 `pnpm` 运行：

### 查看状态
- `attachments:list` - 列出未处理的文件
- `attachments:count` - 计算未处理的文件
- `attachments:organized` - 计算已组织的文件
- `attachments:sizes` - 显示最大的文件
- `attachments:recent` - 最近 7 天添加的文件

### 发现问题
- `attachments:orphans` - 任何地方都没有引用的文件
- `attachments:refs [filename]` - 查找对文件的引用

### 组织
- `attachments:create-organized` - 创建 Organized 文件夹

## Claude Code 工作流

### 处理截图
```
查看 50_Attachments 中的近期截图。
基于它们的内容，建议更好的名称。
帮助我组织它们。
```

### 查找孤立文件
```
查找所有笔记中未引用的附件。
任何应该删除的吗？
```

### 批量重命名
```
查看 Attachments 中未处理的图像。
基于内容建议描述性名称。
```

### 清理
```
在 Attachments 中查找重复图像。
查找超过 10MB 的文件。
什么可以压缩或删除？
```

## 最佳实践

### 文件大小
- 图像保持在 2MB 以下用于 Git
- 压缩大型 PDF
- 对视频使用外部存储
- 提交前优化图像

### 命名
- 包含日期：`YYYY-MM-DD`
- 描述性但简洁
- 使用下划线而不是空格
- 如相关包含版本号

### 链接
```markdown
# 嵌入图像
![[50_Attachments/Organized/diagram.png]]

# 链接 PDF
[[50_Attachments/Organized/document.pdf]]

# 带描述
![[50_Attachments/Organized/chart.png|Sales Chart Q1]]
```

## 处理工作流

1. **捕捉**：保存文件到 `50_Attachments/`
2. **审查**：查看内容，确定目的
3. **重命名**：给予描述性的、带日期的名称
4. **组织**：移到 `Organized/` 子文件夹
5. **链接**：更新笔记中的引用
6. **清理**：删除孤立文件

## Claude Code 提示

### 视觉分析
```
分析 Attachments 中的图像。
它们包含什么？
建议适当的名称和组织。
```

### 批量处理
```
处理本周的所有 CleanShot 文件。
基于内容重命名。
移到 Organized。
```

### 存储审计
```
分析附件存储：
- 总大小
- 最大的文件
- 文件类型分布
- 孤立文件
```

## 提示

- **每周处理** - 不要让文件堆积
- **立即命名** - 上下文很快消退
- **有目的地链接** - 只嵌入增加价值的内容
- **积极压缩** - 存储会累积
- **自由删除** - 不是每个截图都重要

## Git 考虑

### .gitignore 建议
```
*.mp4
*.mov
*.zip
.DS_Store
files_over_10mb/
```

### 对于大文件
- 对超过 10MB 的文件使用 Git LFS
- 考虑外部存储
- 改为链接到云存储
- 本地保留但 gitignore

## 记住

附件支持你的笔记，它们不会替代笔记。一个命名良好、组织良好的附件胜过一千个随机截图。使用 Claude Code 的视觉能力帮助高效地处理和组织视觉内容。
