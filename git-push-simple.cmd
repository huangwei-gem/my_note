@echo off
chcp 65001 >nul

echo Git Auto Push Script
echo Remote: https://github.com/huangwei-gem/my_note

REM Pull latest code
echo 1. Pull latest code...
git pull
if %errorlevel% neq 0 goto error

echo 2. Add all changes...
git add .
if %errorlevel% neq 0 goto error

REM Check if there are changes
git status --porcelain | findstr /r /v "^$" >nul
if %errorlevel% neq 0 (
    echo No changes to commit.
    pause
    exit /b 0
)

REM Commit with default message
echo 3. Commit changes...
git commit -m "Auto commit" --allow-empty
if %errorlevel% neq 0 goto error

echo 4. Push to remote...
git push
echo Push completed successfully!
pause
exit /b 0

:error
echo Error occurred. Please check the output above.
pause
exit /b 1