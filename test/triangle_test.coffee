vows = require("vows")
assert = require("assert")
zombie = require("zombie")
app = require("../app")

port = 3000
baseUrl = "http://localhost:#{port}"

vows.describe("a sample vow")
.addBatch
  "evaluate":
    topic: () ->
      browser = new zombie.Browser({ debug: true })
      browser.runScripts = true
      browser.visit baseUrl, @callback

    'press':
      topic: (browser, status) ->
        console.log "1 --------"
        cb = @callback
        browser.pressButton '#my_submit_0', (err, browser, status) ->
          console.log "2 -------- #{err}, #{status[0]}"
          assert.equal(browser.text('#result'), '')
          console.log "3 -------- #{err}, #{status}"
          cb(err, browser, status)

      "see result" : (err, browser, status) ->
          console.log "4 --------  #{err}, #{status}"
          assert.equal(browser.text('#result'), '')
          console.log "5 --------  #{err}, #{status}"

.export module
