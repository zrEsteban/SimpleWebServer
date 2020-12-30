import http.server
import socketserver
import sys

class MyHttpRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.path = sys.argv[2] 
        return http.server.SimpleHTTPRequestHandler.do_GET(self)

# Create an object of the above class
handler_object = MyHttpRequestHandler

PORT = int(sys.argv[1])

httpd = socketserver.TCPServer(("", PORT), handler_object,False)
httpd.allow_reuse_address = True # Prevent 'cannot bind to address' errors on restart
httpd.server_bind()     # Manually bind, to support allow_reuse_address
httpd.server_activate() # (see above comment)
# Star the server
httpd.serve_forever()

