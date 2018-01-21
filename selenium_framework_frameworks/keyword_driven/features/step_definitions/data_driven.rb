When("I open {string} website") do |website|
  access website
end

Then("I login using credentials {string} and {string}") do |email, password|
  sign_in(email, password)
  sign_in_error_check
end

Then("I contact customer service with order reference {string} and message {string}") do |order, message|
  contact_customer_service(order, message)
  form_submit_success_check
end