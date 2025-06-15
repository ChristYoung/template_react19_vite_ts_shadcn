#!/bin/bash

# 添加新项目的脚本
# 用法: ./scripts/add-project.sh <project-name>

if [ -z "$1" ]; then
  echo "用法: $0 <project-name>"
  echo "示例: $0 admin"
  exit 1
fi

PROJECT_NAME=$1
PROJECT_PATH="packages/$PROJECT_NAME"

# 检查项目是否已存在
if [ -d "$PROJECT_PATH" ]; then
  echo "错误: 项目 $PROJECT_NAME 已存在于 $PROJECT_PATH"
  exit 1
fi

echo "正在创建新项目: $PROJECT_NAME..."

# 复制 web 项目作为模板
cp -r packages/web "$PROJECT_PATH"

# 更新 package.json 中的项目名称
sed -i '' "s/@motters\/web/@motters\/$PROJECT_NAME/g" "$PROJECT_PATH/package.json"

echo "项目 $PROJECT_NAME 创建成功！"
echo ""
echo "下一步操作："
echo "1. 在根目录 package.json 中添加以下脚本："
echo "   \"dev:$PROJECT_NAME\": \"yarn workspace @motters/$PROJECT_NAME dev\","
echo "   \"build:$PROJECT_NAME\": \"yarn workspace @motters/$PROJECT_NAME build\","
echo "   \"lint:$PROJECT_NAME\": \"yarn workspace @motters/$PROJECT_NAME lint\""
echo ""
echo "2. 运行 yarn install 安装依赖"
echo "3. 开始开发: yarn workspace @motters/$PROJECT_NAME dev" 
