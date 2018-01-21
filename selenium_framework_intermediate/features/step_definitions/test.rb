Given(/^I open youtube$/) do
  visit "https://youtube.com.br"
end

When(/^I search for "([^"]*)"$/) do |key|
  fill_in("search_query", with: key)
  
end

Then(/^I click on search$/) do
  click_button('search-icon-legacy')
  
end

Then(/^I see the results$/) do
  expect(page).to have_css("paper-button")
  
end