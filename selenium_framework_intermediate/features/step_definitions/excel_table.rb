When(/^I create the excel worbook "([^"]*)"$/) do |excel_workbook|
  @my_workbook = RubyXL::Workbook.new
  @my_workbook.add_worksheet('sheet2') # add new sheet
  data_sheet = @my_workbook[0] # save first sheet to variable
  data_sheet.sheet_name = 'data' # rename sheet 1
  data_sheet.add_cell(0, 0, 'Name') # add cells
  data_sheet.add_cell(0, 1, 'Website')
  data_sheet.add_cell(0, 2, 'Address')
  data_sheet.add_cell(1, 0, 'Praddep')
  data_sheet.add_cell(1, 1, 'www.seleniumframework.com')
  data_sheet.add_cell(1, 2, 'Europe')
  @my_workbook.write(excel_workbook)
end

Then(/^I print the data inside the workbook$/) do
  random_xls = RubyXL::Parser.parse('Random.xlsx') # access existing excel file
  sheet = random_xls['data'] # save sheet data to variable
  puts sheet.sheet_data[1][0].value # prints cell value with specified line, column
  puts sheet.sheet_data[1][1].value
  puts sheet.sheet_data[1][2].value
end

When(/^I perform delete operations on a workbook$/) do
  # insert row
  my_excel = RubyXL::Parser.parse('Random.xlsx')
  sheet = my_excel['data']
  sheet.add_cell(2, 0, 'champs')
  sheet.add_cell(2, 1, 'none')
  sheet.add_cell(2, 2, 'sumere')
  sheet.add_cell(3, 0, 'champs')
  sheet.add_cell(3, 1, 'none')
  sheet.add_cell(3, 2, 'sumere')
  
  # delete row
  sheet.delete_row(3)

  # insert column
  sheet.add_cell(0, 3, "new column")
  sheet.add_cell(1, 3, "new")
  sheet.add_cell(2, 3, "column")
  sheet.add_cell(0, 4, "new column")
  sheet.add_cell(1, 4, "new")
  sheet.add_cell(2, 4, "column")

  # delete column
  sheet.delete_column(4)

  # insert cell
  sheet.add_cell(3, 0, "added")
  sheet.insert_cell(3, 1, "inserted")

  # delete cell
  sheet.delete_cell(3, 0)
  sheet.delete_cell(3, 1)

  my_excel.write('Random.xlsx')
end

When(/^I read the excel file "([^"]*)"$/) do |data_sheet|
  path =  Dir.pwd + '/features/support/' + data_sheet
  @data = RubyXL::Parser.parse(path)
end

Then(/^I access a worksheet$/) do
  # number of worksheets
  puts @data.worksheets.size
  # name of worksheets
  @data.worksheets.each { |sheet| puts sheet.sheet_name }
  sheet = @data['Sheet1']
  puts sheet[0]
end

Then(/^I access the rows and cells$/) do
  # number of rows
  sheet = @data['Sheet1']
  puts sheet.sheet_data.size

  # number of columns
  first_row = sheet.sheet_data[0]
  puts first_row.size

  # columns names of first row
  puts first_row[0].value
  first_row.cells.each { |cell| puts cell.value}

  # print all cells
  sheet.each do |row|
    row && row.cells.each do |cell|
      val = cell && cell.value
      puts val
    end
  end
end

Then(/^I convert the sheet data into hash with keys as column headers$/) do
  sheet = @data['Sheet1'] 
  header = sheet.sheet_data[0] #save first row
  $table = {} # create empty hash
  header.cells.each_with_index do |cell, i| # iterate over first row cells
    $table[cell.value] = i # save each cell val and position to hash table
  end
  puts $table # prints table
end

When(/^I fill the form with data from excel$/) do
  sheet = @data['Sheet1']
  fill_in( 'firstname', with: sheet.sheet_data[1][$table['firstname']].value )
  fill_in( 'lastname', with: sheet.sheet_data[1][$table['lastname']].value )
  
  gender = sheet.sheet_data[1][$table['sex']].value
  find("input[value='#{gender}'").click
  
  yrs = sheet.sheet_data[1][$table['yrs']].value
  find("input[value='#{yrs}'").click
  
  date = sheet.sheet_data[1][$table['date_stopped']].value
  fill_in( 'datepicker', with: date )

  tea = sheet.sheet_data[1][$table['tea']].value
  find("input[value='#{tea}'").click

  excited_about	= sheet.sheet_data[1][$table['excited_about']].value
  find("input[value='#{excited_about}'").click

  continent	= sheet.sheet_data[1][$table['continent']].value
  select(continent, from: 'continents')

  selenium_commands = sheet.sheet_data[1][$table['selenium_commands']].value
  select(selenium_commands, from: 'selenium_commands')  
  
end

