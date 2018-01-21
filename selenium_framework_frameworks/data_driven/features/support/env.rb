require 'capybara/cucumber'
require 'rspec'
require 'rubyXL'
require 'selenium-webdriver'
require './features/support/data_helper.rb'

OR = YAML.load_file './features/support/object_repository.yml'
World DataHelper

browser = ENV['BROWSER'] == 'chrome' ? :chrome : :firefox

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app, 
    browser: browser
    )
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 20