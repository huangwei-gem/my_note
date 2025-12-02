# 一键Git提交脚本
# 使用方法: 在PowerShell中运行: .\git_auto_commit.ps1
# 或者添加参数: .\git_auto_commit.ps1 "你的提交信息"

param(
    [string]$commitMessage = "Auto commit: Update notes"
)

Write-Host "=== Git Auto Commit Script ===" -ForegroundColor Green
Write-Host "Remote: https://github.com/huangwei-gem/my_note" -ForegroundColor Yellow

# 检查是否在Git仓库中
if (-not (Test-Path .git)) {
    Write-Host "错误: 当前目录不是Git仓库!" -ForegroundColor Red
    exit 1
}

# 配置Git用户信息（如果还没有配置）
$gitName = git config user.name
$gitEmail = git config user.email

if (-not $gitName) {
    git config user.name "huangwei-gem"
    Write-Host "已设置Git用户名: huangwei-gem" -ForegroundColor Cyan
}

if (-not $gitEmail) {
    git config user.email "huangwei.gem@example.com"
    Write-Host "已设置Git邮箱: huangwei.gem@example.com" -ForegroundColor Cyan
}

# 检查远程仓库
$remoteUrl = git config --get remote.origin.url
if (-not $remoteUrl) {
    Write-Host "添加远程仓库..." -ForegroundColor Yellow
    git remote add origin https://github.com/huangwei-gem/my_note.git
} else {
    Write-Host "远程仓库已配置: $remoteUrl" -ForegroundColor Green
}

# 禁用嵌入仓库警告
git config advice.addEmbeddedRepo false

# 添加所有文件
Write-Host "添加所有文件..." -ForegroundColor Yellow

# 特殊处理obsidian笔记目录 - 先进入目录提交，再回到主目录
if (Test-Path "obsidian笔记") {
    Write-Host "处理obsidian笔记目录..." -ForegroundColor Cyan
    Push-Location
    Set-Location "obsidian笔记"
    git add .
    git commit -m "Update obsidian notes" 2>$null
    Pop-Location
}

git add -A

# 检查是否有更改
$status = git status --porcelain
if (-not $status) {
    Write-Host "没有文件更改，无需提交!" -ForegroundColor Green
    exit 0
}

# 显示状态
Write-Host "Git状态:" -ForegroundColor Yellow
git status --short

# 提交更改
Write-Host "提交更改: $commitMessage" -ForegroundColor Yellow
git commit -m $commitMessage

if ($LASTEXITCODE -ne 0) {
    Write-Host "提交失败!" -ForegroundColor Red
    exit 1
}

# 推送到远程仓库
Write-Host "推送到远程仓库..." -ForegroundColor Yellow
git push origin master

if ($LASTEXITCODE -eq 0) {
    Write-Host "=== 提交成功! ===" -ForegroundColor Green
    Write-Host "所有文件已推送到: https://github.com/huangwei-gem/my_note" -ForegroundColor Green
    
    # 显示最近的提交
    Write-Host "最近提交记录:" -ForegroundColor Cyan
    git log --oneline -3
} else {
    Write-Host "推送失败! 请检查网络连接和远程仓库权限。" -ForegroundColor Red
    exit 1
}

Write-Host "=== 脚本执行完成 ===" -ForegroundColor Green