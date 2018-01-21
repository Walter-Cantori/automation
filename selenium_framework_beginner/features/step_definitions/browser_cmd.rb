When(/^I open uol website$/) do
    visit "https://www.uol.com.br/"
    @url = page.current_url 
end

Then(/^I print the browser name$/) do
    puts page.title
end

Then(/^I print the browser ready state$/) do
    puts page.title
end

When(/^I click ABOUT link$/) do
   find_link('Assine').click
end

Then(/^I click back on the browser$/) do
    page.go_back
end

Then(/^I click forward on the browser$/) do
    page.go_forward
end

Then(/^I click refresh on the browser$/) do
    visit "https://www.uol.com.br/"
end