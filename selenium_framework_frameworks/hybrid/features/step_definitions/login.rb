When("I open automationpractice website") do
    @home_page = HomePage.new
    @home_page.load
end

When("I login with username {string} and password {string}") do |username, password|
    @home_page.sign_in.click
    @login_page = LoginPage.new
    @login_page.login(username, password)
end

Then("I verify that I successfully logged in by logging out") do
  @my_account_page = MyAccountPage.new
  expect(@my_account_page).to have_content 'My account'
end

Then("I verify that I receive a failure message") do
  expect(@login_page).to have_css('div.alert.alert-danger')
  expect(@login_page).to have_css('li', text: "Authentication failed.")
end