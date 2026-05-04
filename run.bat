@echo off
chcp 65001
echo ======================================
echo   Seoul Guide 启动脚本
echo ======================================
echo.

cd /d "%~dp0"

REM 安装cpolar（如果还没安装）
if not exist "C:\Program Files\cpolar\cpolar.exe" (
    echo 正在安装cpolar...
    msiexec /i cpolar_amd64.msi /quiet
    timeout /t 5 /nobreak > nul
    echo 安装完成！
    echo.
)

REM 设置Token
echo 正在配置Token...
"C:\Program Files\cpolar\cpolar.exe" authtoken MjVjNTk5NWEtOGU0ZC00ZGYwLThiMDAtNzBmOWI5MzQxMDgz

echo.
echo ======================================
echo   Token配置成功！
echo ======================================
echo.

REM 启动HTTP服务器
echo 正在启动HTTP服务器...
start "HTTP Server" cmd /k "cd /d "%~dp0" && python -m http.server 8080"

timeout /t 2 /nobreak > nul

REM 启动cpolar
echo 正在启动公网链接...
start "Cpolar Tunnel" cmd /k "C:\Program Files\cpolar\cpolar.exe http 8080"

echo.
echo ======================================
echo   启动完成！
echo ======================================
echo.
echo 请查看"Cpolar Tunnel"窗口中的公网链接
echo 格式类似：https://xxxxx.trycpoar.dev
echo.
pause
