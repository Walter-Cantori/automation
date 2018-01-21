When(/^I open seleniumframework website$/) do
    visit "http://www.seleniumframework.com"
    @url = page.current_url 
end
  
Then(/^I print title, url and page source$/) do
    puts page.title
    puts @url
    puts page.current_url 
end