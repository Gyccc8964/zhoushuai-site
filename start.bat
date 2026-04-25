@echo off
title 周俊个人网站
cd /d "%~dp0"

echo ==============================
echo  周俊个人网站 - 启动器
echo ==============================
echo.

echo [1/2] 启动本地服务器...
start /b "" npx serve . -l 3000 --no-clipboard > nul 2>&1
timeout /t 3 > nul

echo [2/2] 创建公网隧道...
start /b "" ssh -o StrictHostKeyChecking=no -R 80:localhost:3000 serveo.net 2>&1
timeout /t 5 > nul

echo.
echo ✅ 网站已启动！
echo.
echo 本地访问: http://localhost:3000
echo 外网访问: http://serveo.net 查看你的地址
echo.
echo 按任意键关闭...
pause > nul

taskkill /f /im node.exe > nul 2>&1
taskkill /f /im ssh.exe > nul 2>&1
