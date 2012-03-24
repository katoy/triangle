require 'rubygems'

require 'selenium/webdriver'
require 'selenium/client'
require 'selenium/server'

server = Selenium::Server.new("../selenium-server-standalone-2.20.0.jar", :background => true)
server.start

begin

  selenium = Selenium::Client::Driver.new({ :host    => "localhost",
                                            :port    => 4444,
                                            :url     => "http://google.com",
                                            :browser => "*webdriver"
                                          })
  
  # driver = Selenium::WebDriver.for :firefox
  driver = Selenium::WebDriver.for :chrome
  # driver = Selenium::WebDriver.for :opera

  driver.get "http://google.com"

  element = driver.find_element :name => "q"
  element.send_keys "webdriverjs"
  element.submit

  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until {  driver.title.downcase.start_with? "webdriverjs" }

  puts "Page title is #{driver.title}"
  driver.save_screenshot("ruby-google.png")

  # driver.quit
  selsnium.stop
ensure
  server.stop
end
