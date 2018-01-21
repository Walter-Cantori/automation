require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'

Capybara.register_driver :selenium do |app| 
    Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.default_max_wait_time = 20
Capybara.default_driver = :selenium