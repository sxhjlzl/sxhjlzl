#!/usr/bin/env bash
# 一键部署脚本：需要已安装并登录 gh（GitHub CLI）
# 安装: brew install gh && gh auth login
set -e

cd "$(dirname "$0")"

# 1. 创建与用户名同名的仓库（README 会自动展示在个人主页）
gh repo create sxhjlzl --public --description "✨ My GitHub profile" || true

# 2. 初始化并推送
git init -b main 2>/dev/null || git init
git add -A
git commit -m "feat: init beautiful profile README" || true
git remote add origin https://github.com/sxhjlzl/sxhjlzl.git 2>/dev/null || git remote set-url origin https://github.com/sxhjlzl/sxhjlzl.git
git push -u origin main --force

echo ""
echo "✅ 完成！请访问: 1. 打开你的个人主页  2. 到 Actions 手动触发一次 'Generate Snake' 工作流"
