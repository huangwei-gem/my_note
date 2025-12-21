@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo 设置Git用户信息...
git config --global user.name "huangwei-gem"
git config --global user.email "3579628804@qq.com"

echo 拉取最新代码...
git pull origin inside --allow-unrelated-histories

echo 添加所有修改...
git add -A

echo 提交修改...
set "commit_msg=Auto commit - %date% %time%"
git commit -m "!commit_msg!"

echo 推送至inside分支...
git push "https://huangwei-gem:@GJ779408hw@github.com/huangwei-gem/my_note.git" HEAD:inside

echo 操作完成！
pause