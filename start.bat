@echo off
chcp 65001 >nul
cd /d "C:\Users\于馨棋\Desktop\CatPaw Desk\seoul-guide"
echo Starting server...
start /b python -X utf8 -c "import http.server,socketserver;h=http.server.SimpleHTTPRequestHandler;h.extensions_map['.html']='text/html; charset=utf-8';socketserver.TCPServer(('',8080),h).serve_forever()"
timeout /t 2 /nobreak >nul
echo Starting cpolar...
start /b "C:\Program Files\cpolar\cpolar.exe" http 8080
echo Done! Links should appear shortly.
pause
