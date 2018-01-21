When("I open automationpractice website") do
  visit "http://automationpractice.com"
end

When("click contact us") do
  find("#contact-link").click
end

Then("I contact the customer service with excel row {string} dataset") do |row_index|
    puts "Printing object repository...."
    puts OR
  
    data_set=data_excel_hash('Sheet1',row_index)
  
    puts "Printing current data set..."
    puts data_set

    select(data_set['heading'], from: OR['subject_heading_id'])
    fill_in OR['email_id'], with: data_set['email']
    fill_in OR['order_reference_id'], with: data_set['order_reference']
    fill_in OR['message_id'], with: data_set['message']
    click_button OR['submit_message_id'] 
end

When("read excel") do
  workbook = RubyXL::Parser.parse(Dir.pwd + '/features/support/data/default.xlsx')
  sheet = workbook['Sheet1']
  header_row = sheet.sheet_data[0]
  header_row.cells.each { |cell| puts cell.value}
  table = {}
  header_row.cells.each_with_index do |header, i|
    table[header.value] = sheet.sheet_data[2][i].value
  end

  puts table
end