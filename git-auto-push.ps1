<#
.SYNOPSIS
    Git一键提交脚本 - PowerShell版本
.DESCRIPTION
    自动完成Git提交的完整流程：拉取最新代码、添加所有更改、提交、推送到远程仓库
.EXAMPLE
    .\git-auto-push.ps1
    运行脚本，按照提示输入提交信息
.EXAMPLE
    .\git-auto-push.ps1 -CommitMessage "更新README"
    运行脚本，使用指定的提交信息
#>

param (
    [string]$CommitMessage = ""
)

# 设置UTF-8编码
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "=== Git Auto Push Script ===" -ForegroundColor Green
Write-Host "远程仓库: https://github.com/huangwei-gem/my_note" -ForegroundColor Cyan

# 检查是否在Git仓库中
if (-not (Test-Path ".git")) {
    Write-Host "错误: 当前目录不是Git仓库!" -ForegroundColor Red
    Read-Host -Prompt "按Enter键退出"
    exit 1
}

# 拉取最新代码
Write-Host "\n拉取最新代码..." -ForegroundColor Yellow
git pull
if ($LASTEXITCODE -ne 0) {
    Write-Host "拉取失败，请检查网络或权限！" -ForegroundColor Red
    Read-Host -Prompt "按Enter键退出"
    exit 1
}
Write-Host "拉取成功！" -ForegroundColor Green

# 添加所有更改
Write-Host "\n添加所有更改..." -ForegroundColor Yellow
git add -A
Write-Host "添加成功！" -ForegroundColor Green

# 检查是否有更改
$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "\n没有文件更改，无需提交!" -ForegroundColor Cyan
    Read-Host -Prompt "按Enter键退出"
    exit 0
}

# 显示状态
Write-Host "\nGit状态:" -ForegroundColor Yellow
git status --short

# 获取提交信息
if ([string]::IsNullOrWhiteSpace($CommitMessage)) {
    $CommitMessage = Read-Host -Prompt "\n请输入提交信息（默认：Auto commit）"
    if ([string]::IsNullOrWhiteSpace($CommitMessage)) {
        $CommitMessage = "Auto commit"
    }
}

# 提交更改
Write-Host "\n提交更改，提交信息：$CommitMessage..." -ForegroundColor Yellow
git commit -m "$CommitMessage"
if ($LASTEXITCODE -ne 0) {
    Write-Host "提交失败！可能没有需要提交的更改。" -ForegroundColor Red
    Read-Host -Prompt "按Enter键退出"
    exit 1
}
Write-Host "提交成功！" -ForegroundColor Green

# 推送代码到远程仓库
Write-Host "\n推送代码到远程仓库..." -ForegroundColor Yellow
git push origin master
if ($LASTEXITCODE -ne 0) {
    Write-Host "推送失败！请检查网络或权限。" -ForegroundColor Red
    Read-Host -Prompt "按Enter键退出"
    exit 1
}
Write-Host "推送成功！" -ForegroundColor Green

# 显示最近的提交
Write-Host "\n最近提交记录:" -ForegroundColor Yellow
git log --oneline -3

Write-Host "\n=== 提交完成！===" -ForegroundColor Green
Read-Host -Prompt "按Enter键退出"