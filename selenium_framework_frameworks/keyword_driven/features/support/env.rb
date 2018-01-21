require "capybara/cucumber"
require "rspec"
require "selenium-webdriver"
require Dir.pwd + '/features/support/modules/business_modules'

World Keywords
OR = YAML.load_file Dir.pwd + '/features/support/object_repository.yml'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 20