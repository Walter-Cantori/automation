Given(/^I access dtvdashboard$/) do
  @login = Login.new
  visit "http://dtv-dashboard-testA1.mybluemix.net"
end

When(/^I enter valid credentials$/) do
  @login.username_input.set("wrlc@br.ibm.com")
  @login.password_input.set("directv17")
end

And(/^Click on submit$/) do
  @login.click_submit
end

Then(/^access should be granted$/) do
  expect(@login.valid_user_check).to have_content "Walter's Dashboard"
end

When(/^I enter invalid credentials$/) do
  invalid_user = Faker::Internet.email
  invalidPW = Faker::Base.numerify('112419####')
  @login.username_input.set(invalid_user)
  @login.password_input.set(invalidPW)
end

Then(/^I should see an error message$/) do
  expect(@login.invalid_user_check).to have_content("Email/Password not on file, please contact you manager to request access.")
end
