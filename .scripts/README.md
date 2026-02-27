# Scripts 目录

用于 vault 自动化操作的辅助脚本。

## 可用脚本

### 字幕提取

#### transcript-extract.sh

从 YouTube 视频中提取字幕。

```bash
# 基本用法 - 保存到 00_Inbox/Clippings/
.scripts/transcript-extract.sh <youtube-url>

# 自定义输出目录
.scripts/transcript-extract.sh <youtube-url> 10_Projects/Research/
```

### Vault 统计

#### vault-stats.sh

显示 vault 的统计信息，包括各目录的文件数量。

```bash
.scripts/vault-stats.sh
```

## 安装要求

### 字幕提取功能

需要安装 `yt-dlp` 和 `jq`：

```bash
# macOS
brew install yt-dlp jq

# Linux
apt-get install yt-dlp jq

# Windows (WSL)
sudo apt-get install yt-dlp jq
```

## 添加自定义脚本

1. 在 `.scripts/` 目录中创建脚本
2. 添加可执行权限：`chmod +x .scripts/your-script.sh`
3. 在此文档中记录脚本用法

## 注意事项

- 脚本假设为类 Unix 环境（macOS/Linux）
- Windows 用户可能需要 WSL 或 Git Bash
- 所有路径都是相对于 vault 根目录的
- 查看脚本注释以了解额外要求
