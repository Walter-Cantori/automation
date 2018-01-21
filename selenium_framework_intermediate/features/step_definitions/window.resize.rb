When(/^I resize window with "([^"]*)" and "([^"]*)" and print title$/) do |width, height|
  visit 'http://www.seleniumframework.com'
  page.driver.browser.manage.window.resize_to(width, height)
end


Then(/^I print title url and page source$/) do
  expect(page).to have_title "Selenium Framework"
end