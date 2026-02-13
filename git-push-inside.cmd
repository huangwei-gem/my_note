@echo off
chcp 65001 >nul
powershell.exe -NoLogo -ExecutionPolicy Bypass -File "%~dp0git-push-inside.ps1"
pause