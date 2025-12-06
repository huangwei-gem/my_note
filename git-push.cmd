@echo off
chcp 65001 >nul

REM 启用延迟扩展
setlocal enabledelayedexpansion

REM 检查是否在Git仓库中
if not exist .git (
    echo 错误: 当前目录不是Git仓库!
    pause
    exit /b 1
)

echo =========================================
echo           Git一键提交脚本
echo =========================================
echo.

REM 检查远程仓库配置
git config --get remote.origin.url >nul 2>&1
if errorlevel 1 (
    echo 警告: 未配置远程仓库!
    echo 正在添加远程仓库...
    git remote add origin https://github.com/huangwei-gem/my_note.git
    if errorlevel 1 (
        echo 错误: 添加远程仓库失败!
        pause
        exit /b 1
    )
    echo 远程仓库添加成功!
echo.
)

REM 检查分支跟踪状态
git rev-parse --abbrev-ref --symbolic-full-name @{u} >nul 2>&1
if errorlevel 1 (
    echo 正在设置分支跟踪...
    git branch --set-upstream-to=origin/master master
    if errorlevel 1 (
        echo 警告: 设置分支跟踪失败，尝试首次推送...
    )
)

REM 拉取最新代码
echo [1/4] 正在拉取最新代码...
git pull origin master
if errorlevel 1 (
    echo 拉取失败，可能是首次推送或网络问题！
    echo 建议：检查网络连接或远程仓库权限
)
echo.

REM 添加所有更改
echo [2/4] 正在添加所有更改...
git add -A
if errorlevel 1 (
    echo 添加失败！
    pause
    exit /b 1
)
echo 添加成功！
echo.

REM 检查是否有更改
git status --porcelain >nul
if errorlevel 1 (
    echo 没有文件更改，无需提交!
    pause
    exit /b 0
)

REM 获取当前日期和时间，作为默认提交信息
set "datetime=%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%"
set "datetime=%datetime: =0%"

REM 提示用户输入提交信息
echo [3/4] 请输入提交信息（默认：自动提交-%datetime%）：
set /p commit_msg=
if "%commit_msg%"=="" set commit_msg=自动提交-%datetime%

REM 提交更改
echo 正在提交更改，提交信息：%commit_msg%...
git commit -m "%commit_msg%"
if errorlevel 1 (
    echo 提交失败！可能没有需要提交的更改。
    echo 建议：检查是否有未添加的文件或权限问题
    pause
    exit /b 1
)
echo 提交成功！
echo.

REM 推送代码到远程仓库
echo [4/4] 正在推送代码到远程仓库...
git push origin master
if errorlevel 1 (
    echo 推送失败！请检查网络或权限。
    echo 建议：检查网络连接、远程仓库权限或分支设置
    pause
    exit /b 1
)
echo 推送成功！
echo.
echo =========================================
echo           提交完成！
echo =========================================
echo 远程仓库地址：https://github.com/huangwei-gem/my_note.git
echo 当前分支：master
echo.

REM 显示最近的提交记录
echo 最近提交记录：
git log --oneline -3

echo.
pause