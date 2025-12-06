# Git 自动提交脚本 (PowerShell 版本)
# 提供更好的 Unicode 支持和现代化界面

Write-Host "`n=====================================" -ForegroundColor Cyan
Write-Host "    Git 自动提交脚本 (PowerShell版)" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# 检查是否在Git仓库中
if (-not (Test-Path ".git")) {
    Write-Host "错误：当前目录不是Git仓库！" -ForegroundColor Red
    Write-Host "请确保在正确的项目目录中运行此脚本。" -ForegroundColor Yellow
    Read-Host "按回车键退出"
    exit 1
}

# 检查远程仓库配置
Write-Host "[信息] 正在检查远程仓库配置..." -ForegroundColor Gray
$remoteUrl = git config --get remote.origin.url 2>$null

if (-not $remoteUrl) {
    Write-Host "警告：未配置远程仓库！" -ForegroundColor Yellow
    Write-Host "正在添加远程仓库..." -ForegroundColor Yellow
    
    git remote add origin "https://github.com/huangwei-gem/obsidian_data.git"
    if ($LASTEXITCODE -ne 0) {
        Write-Host "错误：添加远程仓库失败！" -ForegroundColor Red
        Read-Host "按回车键退出"
        exit 1
    }
    Write-Host "远程仓库添加成功！" -ForegroundColor Green
}

# 检查分支跟踪状态
Write-Host "[信息] 正在检查分支跟踪状态..." -ForegroundColor Gray
try {
    git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>$null | Out-Null
} catch {
    Write-Host "正在设置分支跟踪..." -ForegroundColor Yellow
    git branch --set-upstream-to=origin/master master
}

Write-Host ""
Write-Host "[步骤 1/4] 正在拉取最新更改..." -ForegroundColor Blue
$pullResult = git pull origin master --allow-unrelated-histories 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "拉取失败，可能是首次推送或网络问题" -ForegroundColor Yellow
} else {
    Write-Host "拉取成功！" -ForegroundColor Green
}

Write-Host ""
Write-Host "[步骤 2/4] 正在添加所有更改..." -ForegroundColor Blue
git add -A
if ($LASTEXITCODE -ne 0) {
    Write-Host "错误：添加文件失败！" -ForegroundColor Red
    Read-Host "按回车键退出"
    exit 1
}
Write-Host "添加文件成功！" -ForegroundColor Green

# 检查是否有更改
Write-Host "[信息] 正在检查是否有文件更改..." -ForegroundColor Gray
$status = git status --porcelain
if (-not $status) {
    Write-Host "提示：没有需要提交的更改！" -ForegroundColor Yellow
    Read-Host "按回车键退出"
    exit 0
}

# 获取当前日期时间
$datetime = Get-Date -Format "yyyyMMdd-HHmmss"

# 输入提交信息
Write-Host "[步骤 3/4] 请输入提交信息（默认：自动提交-$datetime）：" -ForegroundColor Blue
$commitMsg = Read-Host
if ([string]::IsNullOrWhiteSpace($commitMsg)) {
    $commitMsg = "自动提交-$datetime"
}

# 提交更改
Write-Host "正在提交更改..." -ForegroundColor Gray
git commit -m $commitMsg
if ($LASTEXITCODE -ne 0) {
    Write-Host "错误：提交失败！没有需要提交的更改" -ForegroundColor Red
    Read-Host "按回车键退出"
    exit 1
}
Write-Host "提交成功！" -ForegroundColor Green

Write-Host ""
Write-Host "[步骤 4/4] 正在推送到远程仓库..." -ForegroundColor Blue
git push origin master
if ($LASTEXITCODE -ne 0) {
    Write-Host "错误：推送失败！请检查网络连接或权限设置" -ForegroundColor Red
    Read-Host "按回车键退出"
    exit 1
}
Write-Host "推送成功！" -ForegroundColor Green

Write-Host ""
Write-Host "=====================================" -ForegroundColor Green
Write-Host "        提交完成！✅" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green
Write-Host "📍 远程仓库：https://github.com/huangwei-gem/obsidian_data.git" -ForegroundColor Cyan
Write-Host "📋 分支：master" -ForegroundColor Cyan
Write-Host ""

# 显示最近的提交记录
Write-Host "📚 最近的提交记录：" -ForegroundColor Yellow
git log --oneline -3
Write-Host ""
Write-Host "💡 提示：所有操作已完成，按回车键退出..." -ForegroundColor Gray
Read-Host