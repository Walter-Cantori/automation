
Given(/^I open seleniumframerok site in "([^"]*)"$/) do |browser|
  $driver = Selenium::WebDriver.for :firefox if browser == "firefox"
  $driver = Selenium::WebDriver.for :chrome if browser == "chrome"
  $driver.navigate.to "http://www.seleniumframework.com"
end

Then(/^Browser opens showing correct title$/) do
  puts $driver.title
end