
# See
#   https://github.com/Camme/webdriverjs
#
#  Run selenium server first:
#     java -jar ../selenium-server-standalone-2.20.0.jar

webdriverjs = require("webdriverjs")
fs = require("fs")

client = webdriverjs.remote(desiredCapabilities: {browserName: "chrome"} )

client.init().url("http://www.google.com")
client.setValue("#gbqfq", "webdriver")
client.click("#gbqfb")

client.pause(1000)  # 1 sec
client.getTitle()
client.saveScreenshot("coffee-google.png")
client.end()
