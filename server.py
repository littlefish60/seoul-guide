# -*- coding: utf-8 -*-
import http.server
import socketserver
import os

PORT = 8080

# 设置正确的编码
class UTF8Handler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Content-type', 'text/html; charset=utf-8')
        super().end_headers()

os.chdir(os.path.dirname(os.path.abspath(__file__)))

with socketserver.TCPServer(("", PORT), UTF8Handler) as httpd:
    print(f"服务器运行中，访问地址: http://localhost:{PORT}")
    print(f"手机访问地址: http://你的电脑IP:{PORT}")
    httpd.serve_forever()
