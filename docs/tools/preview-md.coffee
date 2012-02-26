
# See  - https://gist.github.com/1098762
#      > realtime markdown preview with Socket.IO

fs = require 'fs'
http = require 'http'
pandoc = require 'pdc'  # npm insall pdc,   Alse need instll pandoc on PATH.
socket = require 'socket.io' # npm install socket.io

target = process.argv[2]
unless target
  console.error 'usage: ' + process.argv[0] + ' ' + process.argv[1] + ' <filename>'
  process.exit 1

PAGE = "<!DOCTYPE html><html><head>" + "<meta charset=\"utf-8\"></meta>" + "<script type=\"text/javascript\" src=\"/socket.io/socket.io.js\"></script>" + "<script type=\"text/javascript\">var socket = io.connect();socket.on(\"change\", function (html) { document.getElementById(\"preview\").innerHTML = html; });</script>" + "</head>" + "<body><div id=\"preview\"></div></body></html>"
server = http.createServer((req, res) ->
  res.writeHead 200,
    'Content-Type': 'text/html'

  res.end PAGE
)

server.listen 3000
console.log 'start server: localhost:3000'

sio = socket.listen(server)
fs.stat target, (err, stat) ->
  throw err  if err

  unless stat.isFile()
    console.error target + ' is not file'
    process.exit 1

  fs.watchFile target,
    interval: 500
  , (curr, prev) ->
    fs.readFile target, "utf8", (err, text) ->
      throw err  if err
      pandoc text, 'markdown', 'html5', '-S --highlight-style=espresso', (err, result) ->
        throw err  if err
        sio.sockets.emit 'change', result
