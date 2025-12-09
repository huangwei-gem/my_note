@echo off
chcp 65001 >nul

echo 正在提交到GitHub outside分支...

:: 配置用户信息
git config user.name "huangwei-gem"
git config user.email "3579628804@qq.com"

:: 创建并切换到outside分支
git checkout -b outside 2>nul || git checkout outside

:: 递归忽略大文件（大于50MB）
echo # 大文件忽略 >> .gitignore 2>nul
for /r %%f in (*) do (
    if %%~zf gtr 52428800 (
        echo %%f >> .gitignore
        echo 忽略大文件: %%f
    )
)

:: 添加所有文件
git add .

:: 检查是否有变更
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo 没有文件变更需要提交。
    pause
    exit /b 0
)

:: 提交并推送
git commit -m "Auto commit - %date% %time%"
git push origin outside

echo 提交完成！
pause