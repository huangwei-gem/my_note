# Set PowerShell encoding to UTF-8
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()
$ErrorActionPreference = "Continue"

$repoPath = $PSScriptRoot
Set-Location $repoPath

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Git Push Script - Inside Branch" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Repository: https://github.com/huangwei-gem/my_note" -ForegroundColor Gray
Write-Host "Branch: inside" -ForegroundColor Gray
Write-Host "Working Directory: $repoPath" -ForegroundColor Gray
Write-Host "========================================" -ForegroundColor Cyan

function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $color = switch ($Level) {
        "ERROR" { "Red" }
        "WARN" { "Yellow" }
        "SUCCESS" { "Green" }
        "DEBUG" { "DarkGray" }
        default { "White" }
    }
    Write-Host "[$timestamp] [$Level] $Message" -ForegroundColor $color
}

function Test-NetworkConnection {
    param([string]$Url = "github.com")
    
    try {
        $result = Test-Connection -ComputerName $Url -Count 1 -Quiet -ErrorAction Stop
        return $result
    }
    catch {
        Write-Log "Network test failed: $($_.Exception.Message)" -Level "DEBUG"
        return $false
    }
}

function Invoke-GitCommand {
    param(
        [string]$Command,
        [string]$Description
    )
    
    Write-Log "Executing: $Description" -Level "DEBUG"
    
    try {
        $output = Invoke-Expression "git $Command 2>&1"
        $exitCode = $LASTEXITCODE
        
        if ($exitCode -ne 0) {
            Write-Log "$Description failed with exit code: $exitCode" -Level "ERROR"
            Write-Log "Error output: $output" -Level "ERROR"
            return @{ Success = $false; Output = $output; ExitCode = $exitCode }
        }
        
        Write-Log "$Description completed successfully" -Level "SUCCESS"
        return @{ Success = $true; Output = $output; ExitCode = 0 }
    }
    catch {
        Write-Log "$Description threw exception: $($_.Exception.Message)" -Level "ERROR"
        return @{ Success = $false; Output = $_.Exception.Message; ExitCode = -1 }
    }
}

Write-Log "Step 1: Checking network connectivity..." -Level "INFO"
if (-not (Test-NetworkConnection)) {
    Write-Log "Warning: Network connectivity test failed. Proceeding anyway..." -Level "WARN"
}
else {
    Write-Log "Network connectivity OK" -Level "SUCCESS"
}

Write-Log "Step 2: Configuring Git user information..." -Level "INFO"
$result = Invoke-GitCommand -Command "config --global user.name 'huangwei-gem'" -Description "Set git user.name"
if (-not $result.Success) {
    Write-Log "Failed to set user.name, but continuing..." -Level "WARN"
}

$result = Invoke-GitCommand -Command "config --global user.email '3579628804@qq.com'" -Description "Set git user.email"
if (-not $result.Success) {
    Write-Log "Failed to set user.email, but continuing..." -Level "WARN"
}

Write-Log "Step 3: Creating .gitignore file..." -Level "INFO"
$gitignoreContent = @"
# Large data files
数据分析笔记/金融数据分析/LCIS.csv
数据分析笔记/金融数据分析/LC.csv
数据分析笔记/金融数据分析/LP.csv
数据分析笔记/金融数据分析/*.xlsx
数据分析笔记/金融数据分析/*.ipynb
数据分析笔记/金融数据分析/ppdai_3_23/
"@

try {
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $True
    $gitignorePath = Join-Path $repoPath ".gitignore"
    [System.IO.File]::WriteAllText($gitignorePath, $gitignoreContent, $Utf8NoBomEncoding)
    Write-Log ".gitignore created at: $gitignorePath" -Level "SUCCESS"
}
catch {
    Write-Log "Failed to create .gitignore: $($_.Exception.Message)" -Level "ERROR"
    Write-Log "Stack trace: $($_.ScriptStackTrace)" -Level "DEBUG"
}

Write-Log "Step 4: Checking Git repository status..." -Level "INFO"
$gitExists = Test-Path ".git"

if (-not $gitExists) {
    Write-Log "No .git directory found. Initializing new repository..." -Level "INFO"
    
    $result = Invoke-GitCommand -Command "init" -Description "Initialize git repository"
    if (-not $result.Success) {
        Write-Log "Failed to initialize repository. Exiting." -Level "ERROR"
        exit 1
    }
    
    $result = Invoke-GitCommand -Command "checkout -b inside" -Description "Create and switch to inside branch"
    if (-not $result.Success) {
        Write-Log "Failed to create inside branch. Exiting." -Level "ERROR"
        exit 1
    }
    
    $result = Invoke-GitCommand -Command "remote add origin https://github.com/huangwei-gem/my_note" -Description "Add remote origin"
    if (-not $result.Success) {
        Write-Log "Failed to add remote. It may already exist. Checking..." -Level "WARN"
        $remoteResult = Invoke-GitCommand -Command "remote -v" -Description "List remotes"
        Write-Log "Current remotes: $($remoteResult.Output)" -Level "DEBUG"
    }
}
else {
    Write-Log "Git repository already exists" -Level "SUCCESS"
    
    $branchResult = Invoke-GitCommand -Command "branch --show-current" -Description "Get current branch"
    Write-Log "Current branch: $($branchResult.Output)" -Level "INFO"
    
    $remoteResult = Invoke-GitCommand -Command "remote -v" -Description "Check remote configuration"
    if ($remoteResult.Output -notmatch "huangwei-gem/my_note") {
        Write-Log "Remote not configured correctly. Setting up remote..." -Level "WARN"
        
        Invoke-GitCommand -Command "remote remove origin" -Description "Remove existing remote" | Out-Null
        Invoke-GitCommand -Command "remote add origin https://github.com/huangwei-gem/my_note" -Description "Add correct remote" | Out-Null
    }
}

Write-Log "Step 5: Staging files..." -Level "INFO"
$result = Invoke-GitCommand -Command "add -A" -Description "Stage all files"
if (-not $result.Success) {
    Write-Log "Failed to stage files. Exiting." -Level "ERROR"
    exit 1
}

Write-Log "Step 6: Checking for changes..." -Level "INFO"
$statusResult = Invoke-GitCommand -Command "status --porcelain" -Description "Check git status"
$changes = $statusResult.Output

if ($changes -and $changes.Trim() -ne "") {
    Write-Log "Changes detected:" -Level "INFO"
    Write-Host $changes -ForegroundColor DarkGray
    
    Write-Log "Step 7: Committing changes..." -Level "INFO"
    $commit_msg = "Auto commit - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $result = Invoke-GitCommand -Command "commit -m `"$commit_msg`"" -Description "Commit changes"
    
    if (-not $result.Success) {
        Write-Log "Failed to commit changes. Exiting." -Level "ERROR"
        Write-Log "This might happen if there are no changes to commit or pre-commit hooks failed." -Level "DEBUG"
        exit 1
    }
    Write-Log "Commit successful: $commit_msg" -Level "SUCCESS"
}
else {
    Write-Log "No changes to commit" -Level "WARN"
}

Write-Log "Step 8: Verifying branch..." -Level "INFO"
$branchResult = Invoke-GitCommand -Command "branch --show-current" -Description "Get current branch"
$currentBranch = $branchResult.Output.Trim()
Write-Log "Current branch: $currentBranch" -Level "INFO"

if ($currentBranch -ne "inside") {
    Write-Log "Switching to inside branch..." -Level "WARN"
    Invoke-GitCommand -Command "checkout inside" -Description "Switch to inside branch"
}

Write-Log "Step 9: Pushing to remote..." -Level "INFO"
$maxRetries = 3
$retryCount = 0
$pushSuccess = $false

while ($retryCount -lt $maxRetries -and -not $pushSuccess) {
    $retryCount++
    Write-Log "Push attempt $retryCount of $maxRetries..." -Level "INFO"
    
    $pushResult = Invoke-GitCommand -Command "push origin HEAD:inside --force" -Description "Push to inside branch"
    
    if ($pushResult.Success) {
        $pushSuccess = $true
        Write-Log "Push successful!" -Level "SUCCESS"
    }
    else {
        Write-Log "Push failed. Exit code: $($pushResult.ExitCode)" -Level "ERROR"
        Write-Log "Error output: $($pushResult.Output)" -Level "ERROR"
        
        if ($retryCount -lt $maxRetries) {
            $waitTime = 5 * $retryCount
            Write-Log "Retrying in $waitTime seconds..." -Level "WARN"
            Start-Sleep -Seconds $waitTime
        }
    }
}

if (-not $pushSuccess) {
    Write-Log "========================================" -Level "ERROR"
    Write-Log "PUSH FAILED AFTER $maxRetries ATTEMPTS" -Level "ERROR"
    Write-Log "========================================" -Level "ERROR"
    Write-Log "Possible causes:" -Level "WARN"
    Write-Log "  1. Network connectivity issues" -Level "WARN"
    Write-Log "  2. Authentication failed (check your credentials)" -Level "WARN"
    Write-Log "  3. Remote repository not accessible" -Level "WARN"
    Write-Log "  4. Git LFS issues (if using large files)" -Level "WARN"
    Write-Log "" -Level "WARN"
    Write-Log "Try running manually: git push origin HEAD:inside --force" -Level "WARN"
    Write-Log "========================================" -Level "ERROR"
    exit 1
}

Write-Host ""
Write-Log "========================================" -Level "SUCCESS"
Write-Log "ALL OPERATIONS COMPLETED SUCCESSFULLY!" -Level "SUCCESS"
Write-Log "========================================" -Level "SUCCESS"
Write-Log "Repository: https://github.com/huangwei-gem/my_note" -Level "INFO"
Write-Log "Branch: inside" -Level "INFO"
Write-Log "Time: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -Level "INFO"
