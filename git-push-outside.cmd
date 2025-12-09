@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo GitHub 一键提交脚本 (outside分支)
echo ========================================

:: 设置变量
set "REPO_URL_SSH=git@github.com:huangwei-gem/my_note.git"
set "REPO_URL_HTTPS=https://github.com/huangwei-gem/my_note.git"
set "USERNAME=huangwei-gem"
set "EMAIL=3579628804@qq.com"
set "BRANCH=outside"
set "MAX_FILE_SIZE=52428800" :: 50MB in bytes

:: 检查git是否安装
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo 错误: Git未安装或未添加到系统PATH中
    pause
    exit /b 1
)

echo.
echo 正在配置Git用户信息...
git config user.name "%USERNAME%"
git config user.email "%EMAIL%"

:: 检查当前目录是否是git仓库
echo.
echo 检查Git仓库状态...
git rev-parse --git-dir >nul 2>&1
if %errorlevel% neq 0 (
    echo 当前目录不是Git仓库，正在初始化...
    git init
    
    :: 首先尝试SSH连接
    echo.
    echo 尝试SSH连接...
    git remote add origin %REPO_URL_SSH%
    
    :: 测试SSH连接
    ssh -T git@github.com >nul 2>&1
    if %errorlevel% equ 0 (
        echo SSH连接成功！
    ) else (
        echo SSH连接失败，切换到HTTPS连接...
        git remote remove origin
        git remote add origin %REPO_URL_HTTPS%
    )
)

:: 检查远程仓库连接
echo.
echo 检查远程仓库连接...
git ls-remote origin >nul 2>&1
if %errorlevel% neq 0 (
    echo 远程仓库连接失败，重新配置...
    git remote remove origin >nul 2>&1
    
    :: 尝试SSH连接
    echo 尝试SSH连接...
    git remote add origin %REPO_URL_SSH%
    ssh -T git@github.com >nul 2>&1
    if %errorlevel% equ 0 (
        echo SSH连接成功！
    ) else (
        echo SSH连接失败，使用HTTPS连接...
        git remote remove origin
        git remote add origin %REPO_URL_HTTPS%
    )
)

:: 检查分支是否存在
echo.
echo 检查分支 '%BRANCH%' 是否存在...
git show-ref --verify --quiet refs/heads/%BRANCH%
if %errorlevel% neq 0 (
    echo 分支 '%BRANCH%' 不存在，正在创建...
    git checkout -b %BRANCH%
) else (
    echo 分支 '%BRANCH%' 已存在，切换到该分支...
    git checkout %BRANCH%
)

:: 递归查找并忽略大文件
echo.
echo 正在扫描大于50MB的文件...
if not exist ".gitignore" (
    echo. > .gitignore
)

:: 将大文件添加到.gitignore (使用更简单的方法)
echo. >> .gitignore
echo # 大文件自动忽略 (自动添加) >> .gitignore
for /r %%f in (*) do (
    if exist "%%f" (
        for %%s in ("%%f") do (
            if %%~zs gtr %MAX_FILE_SIZE% (
                echo 发现大文件: %%f (%%~zs bytes)
                echo %%f >> .gitignore
            )
        )
    )
)

:: 添加常见的不需要提交的文件
echo. >> .gitignore
echo # 系统文件 >> .gitignore
echo Thumbs.db >> .gitignore
echo desktop.ini >> .gitignore
echo .DS_Store >> .gitignore

echo # 临时文件 >> .gitignore
echo *.tmp >> .gitignore
echo *.temp >> .gitignore
echo *.log >> .gitignore

echo # 压缩包 >> .gitignore
echo *.zip >> .gitignore
echo *.rar >> .gitignore
echo *.7z >> .gitignore

:: 添加所有文件到暂存区
echo.
echo 添加文件到暂存区...
git add .

:: 检查是否有文件需要提交
echo.
echo 检查是否有文件需要提交...
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo 没有文件变更需要提交。
    echo.
    echo 按任意键退出...
    pause >nul
    exit /b 0
)

:: 生成提交信息
echo.
set "COMMIT_MSG=Auto commit - %date:~-4%-%date:~3,2%-%date:~0,2% %time:~0,2%:%time:~3,2%"
echo 提交信息: %COMMIT_MSG%

:: 提交更改
echo.
echo 正在提交更改...
git commit -m "%COMMIT_MSG%"
if %errorlevel% neq 0 (
    echo 提交失败！
    pause
    exit /b 1
)

:: 推送到远程仓库
echo.
echo 正在推送到远程仓库的 %BRANCH% 分支...
git push origin %BRANCH%
if %errorlevel% neq 0 (
    echo 推送失败！
    echo 可能的原因:
    echo 1. 网络连接问题
    echo 2. 权限问题
    echo 3. 远程仓库冲突
    pause
    exit /b 1
)

echo.
echo ========================================
echo 成功！所有更改已推送到GitHub
set "CURRENT_TIME=%date% %time%"
echo 完成时间: %CURRENT_TIME%
echo 分支: %BRANCH%
echo ========================================

echo.
echo 按任意键退出...
pause >nul