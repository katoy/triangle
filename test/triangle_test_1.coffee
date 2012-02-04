# 三角形の形状判定

vows = require 'vows'
assert = require 'assert'
zombie = require 'zombie'
# app = require '../src/app'
singleton_app = require './app_singleton'
app = singleton_app.get()

# Start server for test.
app.start()

port = app.port
baseUrl = "http://localhost:#{port}"

# get_result =  (window) ->
#   window.querySelector('#result')

new_browser = () ->
  browser = new zombie.Browser({ debug: false })
  browser.runScripts = true
  browser.waitFor = 3000
  browser

vows.describe("test for triangle")
.addBatch
  "check empty":
    topic: () ->
      new_browser().visit baseUrl, @callback
    'press':
      topic: (browser) ->
        browser.pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), 'a:empty b:empty c:empty ')

  "check 1 1 1":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[1 1 1]':
      topic: (browser) ->
        browser.
          fill('data_a', '1'). fill('data_b', '1').fill('data_c', '1').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), '正三角形')

  "check 3 4 5":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[3 4 5]':
      topic: (browser) ->
        browser.
          fill('data_a', '3').fill('data_b', '4').fill('data_c', '5').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), '直角三角形')

  "check 1 1 2":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[1 1 2]':
      topic: (browser) ->
        browser.
          fill('data_a', '1').fill('data_b', '1').fill('data_c', '2').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), '三角形が作れません')

  "check 2 2 1":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[2 2 1]':
      topic: (browser) ->
        browser.
          fill('data_a', '2').fill('data_b', '2').fill('data_c', '1').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), '二等辺三角形')

  "check 2 3 4":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[2 3 4]':
      topic: (browser) ->
        browser.
          fill('data_a', '2').fill('data_b', '3').fill('data_c', '4').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), '一般の三角形')

  "check 2 3 101":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[2 3 101]':
      topic: (browser) ->
        browser.
          fill('data_a', '2').fill('data_b', '3').fill('data_c', '101').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), 'NG-INPUT')

  "check 30 40 50":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[30 40 50]':
      topic: (browser) ->
        browser.
          fill('data_a', '30').fill('data_b', '40').fill('data_c', '50').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), '直角三角形')

  "check 51 52 53":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[51 52 53]':
      topic: (browser) ->
        browser.
          fill('data_a', '51').fill('data_b', '52').fill('data_c', '53').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), '一般の三角形')

  "check 1.2 10 10":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[1.2 10 10]':
      topic: (browser) ->
        browser.
            fill('data_a', '1.2').fill('data_b', '10').fill('data_c', '10').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), 'a:NG-INPUT ')

  "check 10 1.2 10":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[10 1.2 10]':
      topic: (browser) ->
        browser.
            fill('data_a', '10').fill('data_b', '1.2').fill('data_c', '10').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), 'b:NG-INPUT ')

  "check 10 10 1.2":
    topic: () ->
      new_browser().visit baseUrl, @callback
    '[10 10 1.2]':
      topic: (browser) ->
        browser.
            fill('data_a', '10').fill('data_b', '10').fill('data_c', '1.2').
          pressButton('#my_submit_1', @callback)
      "see result" : (browser) ->
        assert.equal(browser.text('#result'), 'c:NG-INPUT ')

  "check get_method":
    topic: () ->
      new_browser().visit baseUrl + "/triangle_1?a=1&b=1&c=1", @callback
    'get [1 1 1]':  (browser) ->
      assert.equal(browser.html(), '{"method":0,"ans":"REGULAR","err":"","params":{"a":"1","b":"1","c":"1"}}')

.export module
