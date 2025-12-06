@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo Git Auto-Push Script
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
set "commit_msg=Auto commit - %datetime%"

:: 检查是否有自定义提交信息
if not "%1"=="" (
    set "commit_msg=%1"
)

echo Current time: %datetime%
echo Commit message: %commit_msg%
echo Remote repository: %REMOTE_URL%
echo.

:: 检查是否在git仓库中
echo Checking Git repository...
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo Error: Not a Git repository!
    echo Please initialize Git repository first: git init
    pause
    exit /b 1
)
echo Git repository check completed

:: 检查远程仓库是否存在
echo Checking remote repository...
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo Adding remote repository...
    git remote add origin %REMOTE_URL%
    if errorlevel 1 (
        echo Error: Failed to add remote repository!
        pause
        exit /b 1
    )
    echo Remote repository added successfully
) else (
    echo Remote repository exists
)

:: 获取当前分支
echo Checking current branch...
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set "current_branch=%%i"
echo Current branch: %current_branch%

:: 检查是否有未提交的更改
echo Checking file changes...
git status --porcelain | findstr /r /c:"." >nul
if errorlevel 1 (
    echo No file changes detected
    echo Continuing with git pull and push operations...
) else (
    echo File changes detected, adding to staging area...
    
    :: 添加所有更改到暂存区
    git add .
    if errorlevel 1 (
        echo Error: Failed to add files to staging area!
        pause
        exit /b 1
    )
    echo Files added to staging area
    
    :: 提交更改
    echo Committing changes...
    git commit -m "%commit_msg%"
    if errorlevel 1 (
        echo Error: Commit failed!
        pause
        exit /b 1
    )
    echo Commit successful
)

:: 拉取远程更新（避免冲突）
echo Pulling remote updates...
git pull origin %current_branch% --rebase
if errorlevel 1 (
    echo Warning: Conflicts occurred during pull, please resolve manually
    echo After resolving conflicts, execute: git push origin %current_branch%
    pause
    exit /b 1
)

:: 推送到远程仓库
echo Pushing to remote repository...
git push origin %current_branch%
if errorlevel 1 (
    echo Error: Push to remote repository failed!
    echo Possible reasons:
    echo    - Network connection issue
    echo    - Authentication failure (check Git credentials)
    echo    - Branch permission issue
    pause
    exit /b 1
)

echo.
echo ========================================
echo Operation completed! All changes pushed to remote repository
echo Remote repository: %REMOTE_URL%
echo Commit message: %commit_msg%
echo ========================================

:: 显示最新的提交信息
echo.
echo Latest commit info:
git log --oneline -1

pause