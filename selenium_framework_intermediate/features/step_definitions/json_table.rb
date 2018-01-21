When(/^I create a json string$/) do
  json_string = '{"desc":
                    {
                      "someKey":"someValue",
                      "anotherKey":"value"
                    },
                    "main_item":
                      {"stats":
                        {"a":8,"b":12,"c":10}
                      }
                  }'
  @json_hash = JSON.parse(json_string) #exemple to convert string to json, not needed if format is already a hash table
end

Then(/^I parse the string and print keys and values$/) do
  p @json_hash
  p "Printing keys"
  p @json_hash.keys
  p "Printing values"
  p @json_hash.values
  
  p "Accessing some keys"
  p @json_hash["desc"]["someKey"]
  p @json_hash["main_item"]["stats"]["a"]
end

When(/^I create another json string$/) do
  @another_json_string = {
    "menu": {
      "id": "file",
      "value": "File",
      "popup": {
        "menuitem": [
          {"value": "New", "onclick": "CreateNewDoc()"},
          {"value": "Open", "onclick": "OpenDoc()"},
          {"value": "Close",  "onclick": "CloseDoc()"}
        ]
      }
    }
  }
end

Then(/^I parse the string and print its data$/) do
  puts @another_json_string
  @another_json_string.each do |key,value|
    puts "#{key}:#{value}"
  end
  puts "Accessing menuitem array..."
  puts @another_json_string[:menu][:popup][:menuitem]
  puts "Printing menitem array elements..."
  array_menuitem = @another_json_string[:menu][:popup][:menuitem]
  array_menuitem.each do |element|
    puts element
  end
  puts "Accessing a menuitem element as json..."
  puts array_menuitem[0][:value]
end

Then(/^I persist it to a file$/) do
  path = Dir.pwd + '/features/support/'
  File.open("#{path}/test_json.json", "w") do |f|
    f.write(JSON.pretty_generate(@another_json_string))
  end
end

When(/^I read json string from a file$/) do
  path = Dir.pwd + '/features/support'
  json = JSON.parse(IO.read("#{path}/test_json.json"))
  puts json["menu"]
end

When(/^I read the json data file "([^"]*)"$/) do |json_table|
  path = Dir.pwd + '/features/support'
  @data = JSON.parse(IO.read("#{path}/#{json_table}"))
end

When(/^I fill the form with data from json and submit$/) do
  @data["table"].each do |data|
    fill_in('firstname', with: data["firstname"])
    fill_in('lastname', with: data["lastname"])
    find("input[value='#{data["sex"]}'").click
    find("input[value='#{data["yrs"]}'").click
    fill_in( 'datepicker', with: data["date_stopped"] )
    find("input[value='#{data["tea"]}'").click
    find("input[value='#{data["excited_about"]}'").click
    select(data["continent"], from: 'continents')
    select(data["selenium_commands"], from: 'selenium_commands') 
    click_button('submit')
    expect(page).to have_title "Welcome"
    visit "http://www.practiceselenium.com/practice-form.html"
  end
end