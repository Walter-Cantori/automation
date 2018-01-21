When(/^I connect to practiceselenium sqlite(\d+) database$/) do |arg1|
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: './features/support/datafiles/practiceselenium.sqlite'
  )
  @sqlite3_connection = ActiveRecord::Base.connection
end

Then(/^I print the rows in products table$/) do
  products_table = @sqlite3_connection.execute("select * from products")
  products_table.each do |row|
    puts row
  end
end

Then(/^I print the rows in products table using columns$/) do
  table = @sqlite3_connection.execute("select * from products")
  table.each do |row|
    puts row["ID"]
    puts row["CATEGORY_ID"]
    puts row["DESCRIPTION"]
  end
end

Then(/^I print the row that has id "([^"]*)"$/) do |id|
  table = @sqlite3_connection.execute("select * from product_categories where ID = #{id} ")
  puts table[0]["NAME"]
end

Then(/^I update the row whose id is "([^"]*)" and reset it back$/) do |id|
  @sqlite3_connection.execute("update product_categories set NAME = 'new tea' where ID = #{id}")
  table = @sqlite3_connection.execute("select NAME from product_categories where ID = #{id}")
  puts table
  @sqlite3_connection.execute("update product_categories set NAME = 'Tea' where ID = #{id}")
  table = @sqlite3_connection.execute("select NAME from product_categories where ID = #{id}")
  puts table
end

When(/^I retrieve the tea names$/) do
  @teas = all("input[type='checkbox']")  
end


Then(/^I compare the values with the values from database using traditional sql$/) do
  @teas.each do |el|
    check = @sqlite3_connection.execute("select DESCRIPTION from products where DESCRIPTION = '#{el.value}'")
    puts check.size > 0 ? "#{el.value} was found both on page and database" : "#{el.value} was found on page and not on database"
  end
end