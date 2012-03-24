
# See
#   https://github.com/Camme/webdriverjs
#
#  Run selenium server first:
#     java -jar ../selenium-server-standalone-2.20.0.jar

vows = require('vows')
assert = require('assert')
async = require('async');

webdriverjs = require("webdriverjs")
fs = require("fs")

vows.describe('Triangle:正数と０')
.addBatch
  "xxx":
    topic: () ->
      @client = webdriverjs.remote(desiredCapabilities: {browserName: "chrome"} )

    teardown: (topic) ->

    "x": (topic) ->
      @client
        .init()
        .url("http://localhost:3000")
        .click("#my_submit_1")
        .getText("#result", (result) ->
          this.saveScreenshot("coffee-triangke-01.png")
          assert.equal(result.value, "a:empty b:empty c:empty")
        )
        .url("http://localhost:3000")
        .setValue("#data_a", "1")
        .setValue("#data_b", "2")
        .setValue("#data_c", "3")
        .click("#my_submit_1")
        .getText("#result", (result) ->
            this.saveScreenshot("coffee-triangke-02.png")
            assert.equal(result.value, "三角形が作れません")
        )
        .url("http://localhost:3000")
        .setValue("#data_a", "3")
        .setValue("#data_b", "4")
        .setValue("#data_c", "5")
        .click("#my_submit_1")
        .getText("#result", (result) ->
          this.saveScreenshot("coffee-triangke-03.png")
          assert.equal(result.value, "直角三角形")
        )
        .end()

.run()