When(/^I open practiceselenium website$/) do
  visit 'http://www.practiceselenium.com/practice-form.html'
end

When(/^I fill "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/) do |firstname, lastname, sex, yrs, date_stopped|
  fill_in('firstname', with: firstname)
  find('input[name="lastname"]').set(lastname)
  # choose(sex) doesn`t work is already set`
  find("input[value='#{sex}']").click
  # choose(yrs) doen`t work don`t know why
  find("input[value='#{yrs}']").click
  fill_in('datepicker', with: date_stopped)
end

When(/^I fill "([^"]*)" "([^"]*)" "([^"]*)" and "([^"]*)"$/) do |tea, excited_about, continent, selenium_commands|
  find("input[value='#{tea}']").click
  find("input[value='#{excited_about}']").click
  select continent, from: 'continents'
  select selenium_commands, from: 'selenium_commands'
end

When(/^I hit submit button$/) do
  click_button('submit')
end

Then(/^I go back to Welcome page and verify title$/) do
  expect(page).to have_title 'Welcome'
end
