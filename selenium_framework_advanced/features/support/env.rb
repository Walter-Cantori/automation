require "capybara/cucumber"
require "capybara/poltergeist"
require "rspec"




Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    js_errors: false,
    window_size: [1280, 1024]#,
    #debug:       true
  )
end
Capybara.default_driver    = :poltergeist
Capybara.javascript_driver = :poltergeist
