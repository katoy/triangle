# あいうえお
express = require 'express'
triangle = require './src/triangle'

argv = []
argv    = process.argv.slice(2)  if process.argv

routes = require "./routes"
User = require './src/triangle'

app = module.exports = express.createServer()
app.configure ->
  app.use express.logger()

  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.bodyParser()
  app.use express.methodOverride()

  app.use require("stylus").middleware(src: __dirname + "/public")
  app.use app.router
  app.use express.static(__dirname + "/public")

app.configure "development", ->
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure "production", ->
  app.use express.errorHandler()

app.get "/", routes.index

app.post '/triangle', (req, res) ->
  err = ''

  a = req.body.a
  b = req.body.b
  c = req.body.c

  # err +=  "a is empty. " if (!a || a == '')
  # err +=  "b is empty. " if (!b || b == '')
  # err +=  "c is empty. " if (!c || c == '')

  if (err == '')
    a = req.body.a.trim()
    b = req.body.b.trim()
    c = req.body.c.trim()
    err +=  "a is empty. " if ( a == '')
    err +=  "b is empty. " if ( b == '')
    err +=  "c is empty. " if ( c == '')

  a = parseInt(a)
  b = parseInt(b)
  c = parseInt(c)

  tr = new triangle()
  ans = tr.kind(a, b, c)

  res.contentType('application/json');
  data = {triangle: ans, err: err}
  dataJSON = JSON.stringify(data)
  res.send(dataJSON)

port = argv[0] || process.env.PORT || 3000
app.listen port
console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env
