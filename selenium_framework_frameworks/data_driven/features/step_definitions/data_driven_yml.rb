Then("I contact the customer service with yml dataset {string}") do |data_set_key|
  puts "Printing object repository...."
  puts OR
 
  data_set = data_yml_hash[data_set_key]
 
  puts "Printing current data set..."
  puts data_set

  select(data_set['heading'], from: OR['subject_heading_id'])
  fill_in OR['email_id'], with: data_set['email']
  fill_in OR['order_reference_id'], with: data_set['order_reference']
  fill_in OR['message_id'], with: data_set['message']
  click_button OR['submit_message_id']
end