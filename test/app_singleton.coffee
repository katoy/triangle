
express = require 'express'

class Singleton
  @get: ->
    if !@instance
      @instance = new @
      @instance.app = require '../src/app'
      @instance.started = false

    @instance

class Singleton_app extends Singleton
  constructor : -> @
  start : (port)->
    if !@started
      @app.start port
      @started = true

module.exports = Singleton_app
