#!/usr/bin/env bash
set -e

REPO_OWNER="${REPO_OWNER:-happypig1224}"
BRANCH="${BRANCH:-main}"
SKILL_NAME="de-ai-writing-style"
TARGET_DIR="$HOME/.gemini/config/skills/$SKILL_NAME"
TARGET_FILE="$TARGET_DIR/SKILL.md"

echo "==> 准备部署 $SKILL_NAME 技能..."
mkdir -p "$TARGET_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
LOCAL_FILE="$SCRIPT_DIR/../skills/$SKILL_NAME/SKILL.md"

if [ -f "$LOCAL_FILE" ]; then
    cp "$LOCAL_FILE" "$TARGET_FILE"
    echo "✅ [本地部署成功] 技能文件已复制到: $TARGET_FILE"
else
    RAW_URL="https://raw.githubusercontent.com/$REPO_OWNER/$SKILL_NAME/$BRANCH/skills/$SKILL_NAME/SKILL.md"
    echo "==> [远程一键拉取] 正在从 $RAW_URL 下载..."
    curl -fsSL "$RAW_URL" -o "$TARGET_FILE"
    echo "✅ [远程部署成功] 技能文件已部署到: $TARGET_FILE"
fi
echo "🎉 部署完成！在 Antigravity 中输入方案润色或去AI味指令即可自动激活。"
