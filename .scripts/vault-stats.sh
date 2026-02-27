#!/bin/bash

# Vault Statistics Script
# Shows basic stats about your Obsidian vault

echo "=== Vault Statistics ==="
echo ""

echo "📝 Note Counts:"
echo "  Inbox:     $(find 00_Inbox -name "*.md" 2>/dev/null | wc -l)"
echo "  Projects:  $(find 10_Projects -name "*.md" 2>/dev/null | wc -l)"
echo "  Areas:     $(find 20_Areas -name "*.md" 2>/dev/null | wc -l)"
echo "  Resources: $(find 30_Resources -name "*.md" 2>/dev/null | wc -l)"
echo "  Archive:   $(find 40_Archive -name "*.md" 2>/dev/null | wc -l)"
echo ""

echo "📎 Attachments:"
echo "  Total:     $(find 50_Attachments -type f 2>/dev/null | wc -l)"
echo "  Organized: $(find 50_Attachments/Organized -type f 2>/dev/null | wc -l)"
echo ""

echo "📊 Total Notes: $(find . -name "*.md" | wc -l)"
echo ""

echo "🔄 Recent Activity (last 7 days):"
find . -name "*.md" -mtime -7 -type f 2>/dev/null | head -5 | while read file; do
    echo "  - $(basename "$file")"
done