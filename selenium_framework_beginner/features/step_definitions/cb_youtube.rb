Given(/^I am on the YouTube home page$/) do
    visit "http://youtube.com.br"
end
  
When(/^I search for "([^"]*)"$/) do |search|
    fill_in("search_query", with: search)
    #find("button[id='search-icon-legacy']").click #works fine
    #click_on "search-icon-legacy" #works fine
    #click_button "search-icon-legacy" #works fine
    find("#search-icon-legacy").click #works fine
end
  
Then(/^videos of large rodents are returned$/) do
    puts find("#result-count").text
    expect(page).to have_content('rodents')
end

Then(/^I see side bar menu$/) do
    within(:xpath, '//*[@id="sections"]/ytd-guide-section-renderer[1]') do
        all("a").each do |elm|
            puts elm.text
        end
    end
end