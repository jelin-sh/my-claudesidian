# 下载附件

从 URL 下载文件到附件文件夹，并用描述性名称组织它们。

## 使用方法

```
/download-attachment <url1> [url2] [url3...]
```

## 示例

```
/download-attachment https://example.com/document.pdf
/download-attachment https://site.com/image.png https://site.com/report.pdf
```

## 实现

你负责从 URL 下载文件并将它们组织在 Obsidian vault 附件文件夹中。

### 步骤 1：解析和验证 URL

从用户输入中提取 URL。如果提供了多个 URL，则处理多个。

- **验证 URL 方案**：只允许 http:// 或 https:// URL
- **拒绝无效 URL**：file://、ftp:// 或格式错误的 URL
- **验证示例**：

```bash
if [[ ! "$url" =~ ^https?:// ]]; then
  echo "错误：只允许 HTTP/HTTPS URL"
  exit 1
fi
```

### 步骤 2：下载文件

对于每个 URL：

```bash
# 清理文件名以防止路径遍历
# 移除 ../ 和其他危险字符
filename=$(basename "$url" | sed 's/[^a-zA-Z0-9._-]/_/g')

# 使用 wget 或 curl 下载并设置超时
wget --timeout=30 -O "50_Attachments/$filename" "$url"
# 或
curl --max-time 30 -L "$url" -o "50_Attachments/$filename"
```

### 步骤 3：验证下载

检查文件是否成功下载：

```bash
ls -la "50_Attachments/"
```

### 步骤 4：组织文件

下载后，运行 organize-attachments 命令用描述性名称重命名文件：

对于 PDF：

- 使用 `pdftotext` 提取文本
- 分析内容以获取有意义的标题

对于图片：

- 使用 `mcp__gemini-vision__analyze_image` 或
  `mcp__gemini-vision__analyze_multiple`
- 基于内容生成描述性文件名

### 步骤 5：移到已组织

将重命名的文件移到 `50_Attachments/Organized/` 并使用描述性名称

### 步骤 6：更新索引

添加条目到 `50_Attachments/00_Index.md`

### 步骤 7：提交更改

```bash
git add -A
git commit -m "从 URL 下载并组织附件"
git push
```

## 重要说明

1. **文件命名**：
   - 初始下载：使用 URL 文件名或从 URL 生成
   - 分析后：用描述性标题重命名

2. **支持的类型**：
   - 图片：.png、.jpg、.jpeg、.gif、.webp
   - 文档：.pdf、.doc、.docx
   - 文本：.txt、.md
   - 数据：.csv、.xlsx

3. **错误处理**：
   - 检查 URL 是否可访问
   - 验证文件是否正确下载
   - 优雅地处理下载失败

4. **组织**：
   - 下载的文件放到 `50_Attachments/`
   - 重命名后，移到 `50_Attachments/Organized/`
   - 如需要，更新 vault 中的链接

## 工作流程

1. 从提供的 URL 下载文件
2. 识别文件类型并分析内容
3. 生成描述性文件名
4. 移到已组织文件夹
5. 更新索引和引用
6. 提交并推送更改

## 提示

- 对于多个 URL，批量处理以提高效率
- 使用 Gemini Vision 批量分析图片（一次最多 3 张）
- 在重命名之前从 PDF 中提取有意义的上下文
- 保留原始文件扩展名
- 保持文件名简洁但具有描述性（最多 60 个字符）
