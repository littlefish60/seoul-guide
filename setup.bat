@echo off
echo ======================================
echo   Seoul Guide 公网链接生成工具
echo ======================================
echo.

cd /d "%~dp0"

REM 检查是否已有cpolar
if exist "cpolar\cpolar.exe" (
    echo 发现cpolar，跳过下载...
    goto :start
)

REM 下载cpolar
echo 正在下载cpolar，请稍候...
powershell -Command "Invoke-WebRequest -Uri 'https://www.cpolar.com/static/downloads/cpolar-stable-windows-amd64.zip' -OutFile 'cpolar.zip'"
if exist "cpolar.zip" (
    echo 解压中...
    powershell -Command "Expand-Archive -Path 'cpolar.zip' -DestinationPath 'cpolar-temp' -Force"
    move "cpolar-temp\cpolar-stable-windows-amd64" "cpolar"
    rmdir /s /q "cpolar-temp"
    del cpolar.zip
    echo 下载完成！
) else (
    echo 下载失败，请检查网络连接
    pause
    exit
)

:start
echo.
echo ======================================
echo   正在启动服务...
echo ======================================
echo.

REM 启动HTTP服务器
start "HTTP Server" cmd /k "python -m http.server 8080"

REM 等待服务器启动
timeout /t 2 /nobreak > nul

REM 启动cpolar
start "Cpolar Tunnel" cmd /k "cpolar\cpolar.exe http 8080"

echo.
echo ======================================
echo   服务已启动！
echo ======================================
echo.
echo 请把下面这个链接发给你的朋友：
echo.
echo 注意：首次使用需要到 https://www.cpolar.com 注册账号
echo 注册后在终端输入：cpolar authtoken 你的TOKEN
echo.
pause
