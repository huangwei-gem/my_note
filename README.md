# 📚 我的笔记仓库

这是一个个人知识管理和笔记仓库，使用 Obsidian 作为主要的笔记工具，并包含自动化的 Git 提交脚本。

## 🏗️ 仓库信息

- **远程仓库地址**：https://github.com/huangwei-gem/obsidian_data.git
- **本地管理工具**：Obsidian + 40+ 增强插件
- **自动提交脚本**：中文增强版 Git 自动化脚本
- **主要内容**：个人笔记、学习记录、思考总结、手绘图解

## 如何使用

### 🎯 克隆仓库
```bash
git clone https://github.com/huangwei-gem/obsidian_data.git
```

### 📖 本地管理
1. **安装 Obsidian** - 下载并安装 Obsidian 应用
2. **打开仓库** - 在 Obsidian 中选择 `obsidian笔记` 文件夹作为仓库
3. **享受功能** - 探索 40+ 插件、多主题、手绘集成等丰富功能

### 🚀 提交代码

#### 方法一：使用一键提交脚本（推荐）
```bash
# 双击运行或在命令行执行
git-push.cmd
```
**特点**：
- ✅ 全中文界面，操作简单直观
- 🔄 四步自动化：拉取→添加→提交→推送
- 💡 智能错误处理和详细提示
- 📊 显示最近提交记录

#### 方法二：手动提交
```bash
git pull origin master --allow-unrelated-histories
git add -A
git commit -m "提交信息"
git push origin master
```

## 📁 项目结构详解

```
c:\笔记\
├── .gitignore                    # Git 忽略文件配置
├── .trae\                        # Trae IDE 配置目录
│   └── documents\               # Trae 文档记录
├── AI笔记\                       # 🤖 AI 相关笔记和资料
├── git-push.cmd                  # 🚀 Git 自动提交脚本（中文增强版）
├── git-push-simple.cmd           # 📝 简化版Git脚本（避免乱码）
├── git-push-ps.ps1               # 💻 PowerShell版本（Unicode支持）
├── 编码问题解决方案.md            # 🔤 编码问题详细解决方案
└── obsidian笔记\                 # 📖 Obsidian 笔记主目录
    ├── .makemd\                 # Make.md 插件配置
    ├── .obsidian\               # ⚙️ Obsidian 核心配置
    │   ├── plugins\             # 🔌 插件目录（40+ 插件）
    │   │   ├── calendar\        # 日历插件
    │   │   ├── copilot\        # AI 助手插件
    │   │   ├── dataview\       # 数据视图插件
    │   │   ├── excalidraw-cn\  # 中文手绘插件
    │   │   ├── obsidian-git\   # Git 集成插件
    │   │   ├── quickadd\       # 快速添加插件
    │   │   ├── templater-obsidian\ # 模板插件
    │   │   └── ...             # 其他实用插件
    │   ├── snippets\           # 🎨 CSS 代码片段和样式
    │   ├── themes\             # 🎭 主题目录（AnuPpuccin、Blue Topaz等）
    │   └── workspace.json       # 工作区配置
    ├── .space\                 # Space 插件配置
    ├── .trash\                 # 🗑️ 回收站目录
    ├── Excalidraw\             # ✏️ 手绘图和流程图
    ├── MDFriday\               # MDFriday 站点配置
    ├── Tags\                   # 🏷️ 标签分类目录
    └── img_data\               # 🖼️ 图片资源目录
```

## ⚠️ 注意事项

1. **🔒 定期备份** - 重要笔记定期备份到安全位置
2. **🔄 避免冲突** - 提交前确保拉取最新代码，避免合并冲突
3. **🏷️ 合理分类** - 使用标签和文件夹科学管理笔记
4. **🚫 敏感信息** - 请勿将敏感信息提交到公开仓库
5. **🔧 插件管理** - 定期更新插件以获得最新功能和安全修复
6. **编码问题**：如遇中文乱码，请参考 `编码问题解决方案.md` 或使用 `git-push-simple.cmd`

## 🔤 编码问题说明

**问题**：在部分 Windows 系统中运行 `git-push.cmd` 可能出现中文乱码

**解决方案**：
- 使用 `git-push-simple.cmd`（系统默认编码）
- 使用 `git-push-ps.ps1`（PowerShell 版本，支持 Unicode）
- 参考 `编码问题解决方案.md` 进行系统设置

**推荐**：普通用户使用简化版，高级用户使用 PowerShell 版本

## 🎯 核心特色

### 🤖 AI 集成
- **Copilot 插件** - AI 助手辅助写作和思考
- **AI 笔记专区** - 专门的 AI 技术资料收集

### 🎨 视觉增强
- **多主题支持** - AnuPpuccin、Blue Topaz、Minimal 等
- **CSS 自定义** - 丰富的样式代码片段
- **手绘集成** - Excalidraw 支持流程图和概念图

### 📊 数据管理
- **Dataview 插件** - 动态内容展示和数据分析
- **日历集成** - 时间线管理和日程规划
- **标签系统** - 科学的分类和检索体系

## 📝 更新日志

### 2025-12-02
- 🎯 远程仓库迁移至 `obsidian_data`
- 🚀 Git 提交脚本升级为中文增强版
- 📚 完善项目文档和结构说明
- 🔌 集成 40+ Obsidian 插件

### 早期版本
- 🏗️ 创建仓库基础结构
- 📝 添加一键提交脚本
- 📖 初始化 Obsidian 配置