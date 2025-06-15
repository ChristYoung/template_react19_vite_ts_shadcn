# Motters Monorepo

这是一个基于 Yarn Workspace 管理的 monorepo 项目，包含多个基于 React 19 + Vite + TypeScript + shadcn/ui 技术栈的前端项目。

## 项目结构

```
motters-monorepo/
├── packages/
│   └── web/                    # 第一个前端项目
│       ├── src/               # 源代码
│       ├── public/            # 静态资源
│       ├── package.json       # 项目依赖
│       ├── vite.config.ts     # Vite 配置
│       ├── tsconfig.json      # TypeScript 配置
│       └── components.json    # shadcn/ui 配置
├── package.json               # 根目录配置（workspace 管理）
└── yarn.lock                  # 依赖锁定文件
```

## 技术栈

- **React 19** - 最新的 React 框架
- **Vite** - 现代化的构建工具
- **TypeScript** - 类型安全的 JavaScript
- **Tailwind CSS** - 实用优先的 CSS 框架
- **shadcn/ui** - 高质量的 UI 组件库
- **Yarn Workspace** - 单体仓库管理

## 快速开始

### 安装依赖

```bash
# 安装所有项目的依赖
yarn install
```

### 开发模式

```bash
# 启动特定项目
yarn dev              # 启动 web 项目
yarn workspace @motters/web dev

# 启动所有项目
yarn dev:all
```

### 构建项目

```bash
# 构建特定项目
yarn build            # 构建 web 项目
yarn workspace @motters/web build

# 构建所有项目
yarn build:all
```

### 代码检查

```bash
# 检查特定项目
yarn lint             # 检查 web 项目
yarn workspace @motters/web lint

# 检查所有项目
yarn lint:all
```

## 添加新项目

要添加新的前端项目，请按照以下步骤：

1. 在 `packages/` 目录下创建新项目目录
2. 复制 `packages/web/` 的配置文件作为模板
3. 修改新项目的 `package.json` 中的 `name` 字段
4. 在根目录 `package.json` 中添加相应的脚本命令
5. 运行 `yarn install` 安装依赖

### 示例：添加 admin 项目

#### 方法一：使用脚本（推荐）

```bash
# 使用提供的脚本快速创建新项目
./scripts/add-project.sh admin

# 安装依赖
yarn install

# 启动新项目
yarn workspace @motters/admin dev
```

#### 方法二：手动创建

```bash
# 复制 web 项目作为模板
cp -r packages/web packages/admin

# 修改 packages/admin/package.json 中的 name
# "name": "@motters/admin"

# 在根目录 package.json 中添加脚本
# "dev:admin": "yarn workspace @motters/admin dev"
```

## 工作区命令

```bash
# 查看所有工作区
yarn workspaces info

# 在特定工作区执行命令
yarn workspace @motters/web <command>

# 在所有工作区执行命令
yarn workspaces run <command>
```

## 依赖管理

```bash
# 为特定项目添加依赖
yarn workspace @motters/web add <package>

# 为所有项目添加开发依赖
yarn add -D <package> -W

# 移除依赖
yarn workspace @motters/web remove <package>
```

## 注意事项

- 所有项目共享同一个 `yarn.lock` 文件
- 公共依赖应该安装在根目录
- 每个项目都有独立的 TypeScript 和 ESLint 配置
- shadcn/ui 组件需要在每个项目中单独配置
