# 设置Git用户信息
git config --global user.name "huangwei-gem"
git config --global user.email "3579628804@qq.com"

# 拉取最新代码
git pull origin inside --allow-unrelated-histories

# 添加所有修改
git add -A

# 提交修改
$commit_msg = "Auto commit - $(Get-Date)"
git commit -m "$commit_msg"

# 推送至inside分支
git push "https://huangwei-gem:@GJ779408hw@github.com/huangwei-gem/my_note.git" HEAD:inside