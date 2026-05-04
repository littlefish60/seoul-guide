import http.server,socketserver
h=http.server.SimpleHTTPRequestHandler
h.extensions_map['.html']='text/html; charset=utf-8'
socketserver.TCPServer(('',8080),h).serve_forever()
