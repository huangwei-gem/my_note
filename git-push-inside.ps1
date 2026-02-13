# Set PowerShell encoding to UTF-8
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

$repoPath = $PSScriptRoot
Set-Location $repoPath

# Set Git user information
git config --global user.name "huangwei-gem"
git config --global user.email "3579628804@qq.com"

# Create .gitignore to exclude large files (with UTF-8 BOM)
$gitignoreContent = @"
# Large data files
数据分析笔记/金融数据分析/LCIS.csv
数据分析笔记/金融数据分析/LC.csv
数据分析笔记/金融数据分析/LP.csv
数据分析笔记/金融数据分析/*.xlsx
数据分析笔记/金融数据分析/*.ipynb
数据分析笔记/金融数据分析/ppdai_3_23/
"@

# Write with UTF-8 BOM
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $True
[System.IO.File]::WriteAllText((Join-Path $repoPath ".gitignore"), $gitignoreContent, $Utf8NoBomEncoding)
Write-Host "Created .gitignore" -ForegroundColor Yellow

# Check if git repo exists
$gitExists = Test-Path ".git"

if (-not $gitExists) {
    # Initialize new git repo
    Write-Host "Initializing new Git repository..." -ForegroundColor Yellow
    git init
    
    # Add remote
    git remote add origin https://github.com/huangwei-gem/my_note
}

# Add all files (respecting .gitignore)
git add -A

# Check if there are changes to commit
$changes = git status --porcelain
if ($changes -ne "") {
    # Commit changes
    $commit_msg = "Auto commit - $(Get-Date)"
    git commit -m "$commit_msg"
    Write-Host "Commit successful: $commit_msg" -ForegroundColor Green
}
else {
    Write-Host "No changes to commit" -ForegroundColor Yellow
}

# Check current branch
Write-Host "Current branch: $(git branch --show-current)" -ForegroundColor Green

# Push to inside branch
Write-Host "Pushing to inside branch..." -ForegroundColor Green
git push origin HEAD:inside --force

Write-Host "Push completed!" -ForegroundColor Green
