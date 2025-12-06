@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo 🚀 Git 一键提交脚本
echo ========================================

:: 设置远程仓库URL
set "REMOTE_URL=https://github.com/huangwei-gem/obsidian_data"

:: 获取当前日期时间
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
    set "month=%%a"
    set "day=%%b"
    set "year=%%c"
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set "hour=%%a"
    set "minute=%%b"
)

:: 格式化日期时间
set "datetime=%year%-%month%-%day% %hour%:%minute%"

:: 默认提交信息
set "commit_msg=自动提交 - %datetime%"

:: 检查是否有自定义提交信息
if not "%1"=="" (
    set "commit_msg=%1"
)

echo 📅 当前时间: %datetime%
echo 📝 提交信息: %commit_msg%
echo 🌐 远程仓库: %REMOTE_URL%
echo.

:: 检查是否在git仓库中
echo 🔍 检查Git仓库状态...
git rev-parse --git-dir >nul 2>&1
timeout /t 3 >nul
if errorlevel 1 (
    echo ❌ 错误: 当前目录不是Git仓库!
    echo 💡 请先初始化Git仓库: git init
    pause
    exit /b 1
)
echo ✅ Git仓库检测完成

:: 检查远程仓库是否存在
echo 🔍 检查远程仓库...
git remote get-url origin >nul 2>&1
timeout /t 2 >nul
if errorlevel 1 (
    echo 🔗 添加远程仓库...
    git remote add origin %REMOTE_URL%
    if errorlevel 1 (
        echo ❌ 错误: 添加远程仓库失败!
        pause
        exit /b 1
    )
    echo ✅ 远程仓库添加成功
) else (
    echo ✅ 远程仓库已存在
)

:: 获取当前分支
echo 🔍 检查当前分支...
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set "current_branch=%%i"
echo 📍 当前分支: %current_branch%

:: 检查是否有未提交的更改
echo 🔍 检查文件更改状态...
git status --porcelain | findstr /r /c:"." >nul
timeout /t 2 >nul
if errorlevel 1 (
    echo ⚠️  没有检测到文件更改
    echo 💡 继续执行git pull和push操作...
) else (
    echo 📂 检测到文件更改，正在添加到暂存区...
    
    :: 添加所有更改到暂存区
    git add .
    if errorlevel 1 (
        echo ❌ 错误: 添加文件到暂存区失败!
        pause
        exit /b 1
    )
    echo ✅ 文件已添加到暂存区
    
    :: 提交更改
    echo 💾 正在提交更改...
    git commit -m "%commit_msg%"
    if errorlevel 1 (
        echo ❌ 错误: 提交失败!
        pause
        exit /b 1
    )
    echo ✅ 提交成功
)

:: 拉取远程更新（避免冲突）
echo 📥 正在拉取远程更新...
git pull origin %current_branch% --rebase
if errorlevel 1 (
    echo ⚠️  拉取远程更新时出现冲突，请手动解决
    echo 💡 解决冲突后，请手动执行: git push origin %current_branch%
    pause
    exit /b 1
)

:: 推送到远程仓库
echo 📤 正在推送到远程仓库...
git push origin %current_branch%
if errorlevel 1 (
    echo ❌ 错误: 推送到远程仓库失败!
    echo 💡 可能的原因:
    echo    - 网络连接问题
    echo    - 认证失败（请检查Git凭据）
    echo    - 分支权限问题
    pause
    exit /b 1
)

echo.
echo ========================================
echo ✅ 操作完成！所有更改已成功推送到远程仓库
echo 📱 远程仓库: %REMOTE_URL%
echo 📝 提交信息: %commit_msg%
echo ========================================

:: 显示最新的提交信息
echo.
echo 🔍 最新提交信息:
git log --oneline -1

pause