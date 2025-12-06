@echo off

REM Check if in Git repository
if not exist .git (
    echo ERROR: Not in a Git repository!
    pause
    exit /b 1
)

echo =============================
echo    Git Auto Commit Script
echo =============================
echo.

REM Check remote repository configuration
git config --get remote.origin.url >nul 2>&1
if errorlevel 1 (
    echo WARNING: Remote repository not configured!
    echo Adding remote repository...
    git remote add origin https://github.com/huangwei-gem/obsidian_data.git
    if errorlevel 1 (
        echo ERROR: Failed to add remote repository!
        pause
        exit /b 1
    )
    echo Remote repository added successfully!
echo.
)

REM Check branch tracking status
git rev-parse --abbrev-ref --symbolic-full-name @{u} >nul 2>&1
if errorlevel 1 (
    echo Setting up branch tracking...
    git branch --set-upstream-to=origin/master master
)

REM Pull latest changes
echo Step 1: Pulling latest changes...
git pull origin master --allow-unrelated-histories 2>nul
if errorlevel 1 (
    echo Pull failed, possible first push or network issue
)
echo.

REM Add all changes
echo Step 2: Adding all changes...
git add -A
if errorlevel 1 (
    echo Add failed!
    pause
    exit /b 1
)
echo Add successful!
echo.

REM Check if there are changes
git status --porcelain >nul
if errorlevel 1 (
    echo No changes to commit!
    pause
    exit /b 0
)

REM Get current date and time for default commit message
set "datetime=%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%"
set "datetime=%datetime: =0%"

REM Prompt for commit message
echo Step 3: Enter commit message (default: Auto commit-%datetime%):
set /p commit_msg=
if "%commit_msg%"=="" set commit_msg=Auto commit-%datetime%

REM Commit changes
echo Committing changes...
git commit -m "%commit_msg%"
if errorlevel 1 (
    echo Commit failed! No changes to commit
    pause
    exit /b 1
)
echo Commit successful!
echo.

REM Push to remote repository
echo Step 4: Pushing to remote repository...
git push origin master
if errorlevel 1 (
    echo Push failed! Check network or permissions
    pause
    exit /b 1
)
echo Push successful!
echo.
echo =============================
echo      Commit Complete!
echo =============================
echo Remote: https://github.com/huangwei-gem/obsidian_data.git
echo Branch: master
echo.

REM Show recent commits
echo Recent commits:
git log --oneline -3

echo.
pause