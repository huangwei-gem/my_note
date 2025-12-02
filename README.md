# 我的笔记仓库

这是一个用于存储个人笔记的Git仓库，使用Obsidian进行本地管理。

## 仓库信息

- 远程仓库地址：https://github.com/huangwei-gem/my_note.git
- 本地管理工具：Obsidian
- 主要内容：个人笔记、学习记录、思考总结

## 如何使用

### 克隆仓库
```bash
git clone https://github.com/huangwei-gem/my_note.git
```

### 本地管理
1. 使用Obsidian打开`obsidian笔记`文件夹
2. 开始编写和管理你的笔记

### 提交代码

#### 方法一：使用一键提交脚本
1. 双击运行`git-push.cmd`文件
2. 按照提示输入提交信息
3. 等待脚本自动完成提交流程

#### 方法二：手动提交
```bash
git pull
git add .
git commit -m "提交信息"
git push
```

## 目录结构

- `obsidian笔记/`：Obsidian笔记主目录
  - `.obsidian/`：Obsidian配置文件
  - `Excalidraw/`：Excalidraw绘图文件
  - `Tags/`：标签管理
  - 其他笔记文件
- `git-push.cmd`：一键提交脚本

## 注意事项

1. 定期备份重要笔记
2. 提交前确保拉取最新代码，避免冲突
3. 合理使用标签和文件夹管理笔记
4. 敏感信息请勿提交到仓库

## 更新日志

- 2025-12-02：创建仓库，添加一键提交脚本
