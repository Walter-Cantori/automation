When(/^I create an array$/) do
  @arr = ["foo", "bar", 1, 2]
end

Then(/^I print its yaml equivalent$/) do
  puts @arr
  puts @arr.to_yaml
end

When(/^I create a json string for yaml conversion$/) do
  @json = {
    name: "foo",
    lastname: "bar",
    jobs: ["tester", "developer", "singer"],
    experience: {
      tester: 2,
      developer: 4,
      singer: 0
    }
  }
end

Then(/^I print the json yaml equivalent and dump to a file$/) do
  puts @json
  puts @json.to_yaml
  File.open("test.yaml", "w") do |f|
      YAML.dump(@json, f)
  end

  File.delete("test.yaml") unless !File.exists?("test.yaml")
end

When(/^I read a file content into yaml$/) do
  path = Dir.pwd + "/features/support/practice.yaml"
  @data = YAML.load_file(path)
end

Then(/^I print different ways of accessing the key value pairs$/) do
  puts @data["row1"]
  puts @data["row2"]
  puts @data["row1"]["firstname"]
  puts @data["row2"]["lastname"]
end

When(/^I have a yaml structure$/) do
  path = Dir.pwd + "/features/support/practice.yaml"
  @data = YAML.load_file(path)
end

Then(/^I convert it to json$/) do
  puts @data.to_json
  File.open("test_to_j.json", "w") do |f|
    f.write(JSON.pretty_generate(@data))
  end
end

When(/^I read yaml from my data file$/) do
  path = Dir.pwd + "/features/support/practice.yaml"
  @data = YAML.load_file(path)
  visit "http://www.practiceselenium.com/practice-form.html"
end

Then(/^I fill the form with data sets$/) do
  row1 = @data["row1"]
  fill_in('firstname', with: row1["firstname"])
  fill_in('lastname', with: row1["lastname"])
  find("input[value='#{row1["sex"]}'").click
  find("input[value='#{row1["yrs"]}'").click
  fill_in( 'datepicker', with: row1["date_stopped"] )
  find("input[value='#{row1["tea"]}'").click
  find("input[value='#{row1["excited_about"]}'").click
  select(row1["continent"], from: 'continents')
  select(row1["selenium_commands"], from: 'selenium_commands') 
  click_button('submit')
  expect(page).to have_title "Welcome"
end