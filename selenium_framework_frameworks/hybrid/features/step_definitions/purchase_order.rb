When("I login") do
    @home_page = HomePage.new
    @home_page.sign_in.click
    @login_page = LoginPage.new
    @login_page.login('test1010@test.com', 'test1234')
end

When("I hover on women menu item and click summer dresses") do
    @home_page = HomePage.new
    @home_page.menu_women.hover
    @home_page.summer_dresses.click
end

When("I add a summer dress to cart") do
    
end

When("verify the item and price") do
pending # Write code here that turns the phrase above into concrete actions
end

When("I verify the address and proceed") do
pending # Write code here that turns the phrase above into concrete actions
end

When("I verify shipping address and proceed") do
pending # Write code here that turns the phrase above into concrete actions
end

When("I select payment method") do
pending # Write code here that turns the phrase above into concrete actions
end

Then("I confirm the order") do
pending # Write code here that turns the phrase above into concrete actions
end