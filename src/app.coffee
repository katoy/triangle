# あいうえお
express = require 'express'
triangle_bad = require './triangle-bad'
triangle = require './triangle'

logger = express.logger

routes = require '../routes'

app = module.exports = express.createServer()

app.configure ->
  app.use express.logger()

  app.set 'views', __dirname + '/../views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()

  app.use require('stylus').middleware(src: __dirname + '/..//public')
  app.use app.router
  app.use express.static(__dirname + '/../public')

app.configure 'development', ->
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure 'production', ->
  app.use express.errorHandler()

app.get '/', routes.index

re = new RegExp(/^\d*$/)

my_parseInts = (vals) ->
  parsed = {}
  for k, v of vals
    res = ''

    if v == undefined || v.trim() == ''
      res = Error('empty')
    else
      v = v.trim()
      m = v.match(re)
      if m == null
        res =  Error('NG-INPUT')
      else
        res = parseInt(v)
    parsed[k] = res

  parsed

eval_triangle = (req, res, kind) ->
  err = ''
  ans = ''

  params = {'a': req.param('a'), 'b': req.param('b'), 'c':req.param('c') }
  parsed = my_parseInts params

  callback = req.query.callback;

  for k, v of parsed
    err += "#{k}:#{v.message} " if typeof(v) == 'object'

  if err == ''
    tr = null;
    tr = new triangle_bad() if kind == 0
    tr = new triangle() if kind == 1
    try
      ans = tr.kind(parsed.a, parsed.b, parsed.c)
    catch ex
      err = "#{ex}"

  res.contentType('application/json');
  data = {method: kind, ans: ans, err: err, params: params}
  dataJSON = JSON.stringify(data)

  ans = ''
  if callback
    ans = callback + '(' + dataJSON + ')'
  else
    ans = dataJSON

  res.send(ans)

app.post '/triangle_0', (req, res) ->
  eval_triangle(req, res, 0)

app.get '/triangle_0', (req, res) ->
  eval_triangle(req, res, 0)

app.post '/triangle_1', (req, res) ->
  eval_triangle(req, res, 1)

app.get '/triangle_1', (req, res) ->
  eval_triangle(req, res, 0)

# port = argv[0] || process.env.PORT || 3000
# app.listen port
# console.log 'Express server listening on port %d in %s mode', app.address().port, app.settings.env
module.exports.start = (port) ->
  app.listen port
  console.log "Express server listening on port #{port} in #{app.settings.env} mode"

