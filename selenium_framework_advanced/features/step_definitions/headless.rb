When("I open practiceselenium.com website") do
  visit "http://www.practiceselenium.com/practice-form.html"
end

Then("I find first and last name and print the html") do
  fname = find('[name=firstname]')
  fname.set('first name')
  fill_in('lastname', with: "last name")
end

Then("I find menu and print the html") do
  menu_link = find('[data-title=Menu]')
  menu_link.click
end