@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo 🚀 Git 一键提交脚本 - 简化版
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
echo.

:: 检查是否在git仓库中
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 当前目录不是Git仓库!
    pause
    exit /b 1
)

:: 检查远程仓库是否存在
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo 🔗 添加远程仓库...
    git remote add origin %REMOTE_URL%
)

:: 获取当前分支
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set "current_branch=%%i"
echo 📍 当前分支: %current_branch%

:: 快速检查文件状态
echo 🔍 检查文件状态...
git status --porcelain >nul 2>&1

:: 如果有更改，执行提交
if not errorlevel 1 (
    echo 📂 检测到文件更改，执行提交...
    git add .
    git commit -m "%commit_msg%"
    echo ✅ 提交完成
) else (
    echo ⚠️  没有检测到文件更改
)

:: 拉取和推送
echo 📥 拉取远程更新...
git pull origin %current_branch% --rebase

echo 📤 推送到远程仓库...
git push origin %current_branch%

if errorlevel 1 (
    echo ❌ 推送失败，请检查网络连接和Git凭据
) else (
    echo ✅ 操作完成！
)

echo ========================================
pause