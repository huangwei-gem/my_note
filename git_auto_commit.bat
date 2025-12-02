@echo off
chcp 65001 >nul

REM Git一键提交脚本 - 批处理版本
REM 使用方法: 双击运行或命令行运行: git_auto_commit.bat

echo === Git Auto Commit Script ===
echo Remote: https://github.com/huangwei-gem/my_note

REM 检查是否在Git仓库中
if not exist .git (
    echo 错误: 当前目录不是Git仓库!
    pause
    exit /b 1
)

REM 配置Git用户信息
git config user.name "huangwei-gem" 2>nul
git config user.email "huangwei.gem@example.com" 2>nul

REM 检查远程仓库
git config --get remote.origin.url >nul
if errorlevel 1 (
    echo 添加远程仓库...
    git remote add origin https://github.com/huangwei-gem/my_note.git
)

REM 禁用嵌入仓库警告
git config advice.addEmbeddedRepo false

REM 拉取最新代码
echo 拉取最新代码...
git pull
if errorlevel 1 (
    echo 拉取失败，请检查网络或权限！
    pause
    exit /b 1
)

REM 添加所有文件
echo 添加所有文件...
git add -A

REM 检查是否有更改
git status --porcelain | findstr /r /v "^$" >nul
if errorlevel 1 (
    echo 没有文件更改，无需提交!
    pause
    exit /b 0
)

REM 显示状态
echo Git状态:
git status --short

REM 提交更改
set /p commitMsg=请输入提交信息(默认: Auto commit): 
if "%commitMsg%"=="" set commitMsg=Auto commit

echo 提交更改: %commitMsg%
git commit -m "%commitMsg%"

if errorlevel 1 (
    echo 提交失败!
    pause
    exit /b 1
)

REM 推送到远程仓库
echo 推送到远程仓库...
git push origin master

if errorlevel 1 (
    echo 推送失败! 请检查网络连接和远程仓库权限。
    pause
    exit /b 1
)

echo === 提交成功! ===
echo 所有文件已推送到: https://github.com/huangwei-gem/my_note

REM 显示最近的提交
echo 最近提交记录:
git log --oneline -3

echo === 脚本执行完成 ===
pause