@echo off
chcp 65001 >nul

REM 启用延迟扩展
setlocal enabledelayedexpansion

REM 定义颜色变量
set "GREEN=[92m"
set "YELLOW=[93m"
set "RED=[91m"
set "CYAN=[96m"
set "WHITE=[97m"
set "RESET=[0m"

REM 检查是否在Git仓库中
if not exist .git (
    echo %RED%错误: 当前目录不是Git仓库!%RESET%
    pause
    exit /b 1
)

echo %WHITE%=========================================%RESET%
echo %WHITE%          Git一键提交脚本%RESET%
echo %WHITE%=========================================%RESET%
echo.

REM 检查远程仓库配置
git config --get remote.origin.url >nul 2>&1
if errorlevel 1 (
    echo %YELLOW%警告: 未配置远程仓库!%RESET%
    echo %YELLOW%正在添加远程仓库...%RESET%
    git remote add origin https://github.com/huangwei-gem/my_note.git
    if errorlevel 1 (
        echo %RED%错误: 添加远程仓库失败!%RESET%
        pause
        exit /b 1
    )
    echo %GREEN%远程仓库添加成功!%RESET%
echo.
)

REM 拉取最新代码
echo %CYAN%[1/4] 正在拉取最新代码...%RESET%
git pull
if errorlevel 1 (
    echo %RED%拉取失败，请检查网络或权限！%RESET%
    echo %YELLOW%建议：检查网络连接或远程仓库权限%RESET%
    pause
    exit /b 1
)
echo %GREEN%拉取成功！%RESET%
echo.

REM 添加所有更改
echo %CYAN%[2/4] 正在添加所有更改...%RESET%
git add -A
if errorlevel 1 (
    echo %RED%添加失败！%RESET%
    pause
    exit /b 1
)
echo %GREEN%添加成功！%RESET%
echo.

REM 检查是否有更改
git status --porcelain >nul
if errorlevel 1 (
    echo %YELLOW%没有文件更改，无需提交!%RESET%
    pause
    exit /b 0
)

REM 获取当前日期和时间，作为默认提交信息
set "datetime=%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%"
set "datetime=%datetime: =0%"

REM 提示用户输入提交信息
echo %CYAN%[3/4] 请输入提交信息（默认：自动提交-%datetime%）：%RESET%
set /p commit_msg=
if "%commit_msg%"=="" set commit_msg=自动提交-%datetime%

REM 提交更改
echo %CYAN%正在提交更改，提交信息：%commit_msg%...%RESET%
git commit -m "%commit_msg%"
if errorlevel 1 (
    echo %YELLOW%提交失败！可能没有需要提交的更改。%RESET%
    echo %YELLOW%建议：检查是否有未添加的文件或权限问题%RESET%
    pause
    exit /b 1
)
echo %GREEN%提交成功！%RESET%
echo.

REM 推送代码到远程仓库
echo %CYAN%[4/4] 正在推送代码到远程仓库...%RESET%
git push origin master
if errorlevel 1 (
    echo %RED%推送失败！请检查网络或权限。%RESET%
    echo %YELLOW%建议：检查网络连接、远程仓库权限或分支设置%RESET%
    pause
    exit /b 1
)
echo %GREEN%推送成功！%RESET%
echo.
echo %WHITE%=========================================%RESET%
echo %GREEN%          提交完成！%RESET%
echo %WHITE%=========================================%RESET%
echo %CYAN%远程仓库地址：https://github.com/huangwei-gem/my_note.git%RESET%
echo %CYAN%当前分支：master%RESET%
echo.

REM 显示最近的提交记录
echo %YELLOW%最近提交记录：%RESET%
git log --oneline -3

echo.
pause