
express = require 'express'

DEFALT_PORT_FOR_TEST = 3003
DEFALT_PORT          = 3000

class Singleton
  @get: ->
    if !@instance
      @instance = new @
      @instance.app = require '../src/app'
      @instance.started = false
      @instance.port = DEFALT_PORT_FOR_TEST

    @instance

class Singleton_app extends Singleton
  constructor : -> @
  start : (port) ->
    if !@started
      @port = port if port
      @app.start @port
      @started = true

module.exports = Singleton_app
