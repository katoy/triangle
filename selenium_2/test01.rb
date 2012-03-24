#
# ruby でテストスクリプトを書く
#
#

require "rubygems"
require "selenium-webdriver"
require "test/unit"

$KCODE = 'utf-8'

class Test1 < Test::Unit::TestCase

  def setup
    # @driver = Selenium::WebDriver.for :firefox
    @driver = Selenium::WebDriver.for :chrome

    @base_url = "http://localhost:3000/"
    @driver.manage.timeouts.implicit_wait = 5
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_1
    @driver.get(@base_url + "/")
    assert_equal "Express", @driver.title

    wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds

    @driver.find_element(:id, "my_submit_1").click
    wait.until { @driver.find_element(:id, "result").text == "a:empty b:empty c:empty"}
    assert_equal "a:empty b:empty c:empty",  @driver.find_element(:id, "result").text, ""

    @driver.find_element(:id, "data_a").clear
    @driver.find_element(:id, "data_a").send_keys "1"
    @driver.find_element(:id, "data_b").clear
    @driver.find_element(:id, "data_b").send_keys "2"
    @driver.find_element(:id, "data_c").clear
    @driver.find_element(:id, "data_c").send_keys "3"
    @driver.find_element(:id, "my_submit_1").click
    wait.until { @driver.find_element(:id, "result").text == "三角形が作れません"}
    assert_equal "三角形が作れません",  @driver.find_element(:id, "result").text, "三角形が作れません"

    @driver.find_element(:id, "data_a").clear
    @driver.find_element(:id, "data_a").send_keys "3"
    @driver.find_element(:id, "data_b").clear
    @driver.find_element(:id, "data_b").send_keys "4"
    @driver.find_element(:id, "data_c").clear
    @driver.find_element(:id, "data_c").send_keys "5"
    @driver.find_element(:id, "my_submit_1").click
    wait.until { @driver.find_element(:id, "result").text == "直角三角形"}
    assert_equal "直角三角形",  @driver.find_element(:id, "result").text, "直角三角形"
    @driver.save_screenshot("ruby-google.png")

  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
end
