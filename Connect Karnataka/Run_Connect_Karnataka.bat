@echo off
title Connect Karnataka Launcher
cd /d "%~dp0"

:: Kill any existing node processes
taskkill /f /im node.exe >nul 2>&1

:: Start backend server in background
start "Connect Karnataka Backend" /min cmd /c "node server/index.js"
timeout /t 2 /nobreak >nul

:: Start Vite dev frontend in background  
start "Connect Karnataka Frontend" /min cmd /c "npm --prefix client run dev"
timeout /t 4 /nobreak >nul

:: Open browser to Vite dev server (port 3000) - always fresh, no cache issues
start http://localhost:3000
exit
