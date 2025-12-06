@echo off
一下chcp 65001 >nul

echo.
echo =====================================
echo     Git 自动提交脚本 (中文增强版)
echo =====================================
echo.

REM 检查是否在Git仓库中
if not exist .git (
    echo 错误：当前目录不是Git仓库！
    echo 请确保在正确的项目目录中运行此脚本。
    pause
    exit /b 1
)
echo.

REM 检查远程仓库配置
echo [信息] 正在检查远程仓库配置...
git config --get remote.origin.url >nul 2>&1
if errorlevel 1 (
    echo 警告：未配置远程仓库！
    echo 正在添加远程仓库...
    git remote add origin https://github.com/huangwei-gem/obsidian_data.git
    if errorlevel 1 (
        echo 错误：添加远程仓库失败！
        pause
        exit /b 1
    )
    echo 远程仓库添加成功！
echo.
)

REM 检查分支跟踪状态
echo [信息] 正在检查分支跟踪状态...
git rev-parse --abbrev-ref --symbolic-full-name @{u} >nul 2>&1
if errorlevel 1 (
    echo 正在设置分支跟踪...
    git branch --set-upstream-to=origin/master master
)

echo.
echo [步骤 1/4] 正在拉取最新更改...
git pull origin master --allow-unrelated-histories 2>nul
if errorlevel 1 (
    echo 拉取失败，可能是首次推送或网络问题
)
echo.

REM 添加所有更改
echo [步骤 2/4] 正在添加所有更改...
git add -A
if errorlevel 1 (
    echo 错误：添加文件失败！
    pause
    exit /b 1
)
echo 添加文件成功！
echo.

REM 检查是否有更改
echo [信息] 正在检查是否有文件更改...
git status --porcelain >nul
if errorlevel 1 (
    echo 提示：没有需要提交的更改！
    pause
    exit /b 0
)

REM 获取当前日期时间作为默认提交信息
set "datetime=%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%"
set "datetime=%datetime: =0%"

REM 输入提交信息
echo [步骤 3/4] 请输入提交信息（默认：自动提交-%datetime%）：
set /p commit_msg=
if "%commit_msg%"=="" set commit_msg=自动提交-%datetime%

REM 提交更改
echo 正在提交更改...
git commit -m "%commit_msg%"
if errorlevel 1 (
    echo 错误：提交失败！没有需要提交的更改
    pause
    exit /b 1
)
echo 提交成功！
echo.

REM 推送到远程仓库
echo [步骤 4/4] 正在推送到远程仓库...
git push origin master
if errorlevel 1 (
    echo 错误：推送失败！请检查网络连接或权限设置
    pause
    exit /b 1
)
echo 推送成功！
echo.
echo =====================================
echo        提交完成！✅
echo =====================================
echo 📍 远程仓库：https://github.com/huangwei-gem/obsidian_data.git
echo 📋 分支：master
echo.

REM 显示最近的提交记录
echo 📚 最近的提交记录：
git log --oneline -3
echo.
echo 💡 提示：所有操作已完成，按任意键退出...
pause