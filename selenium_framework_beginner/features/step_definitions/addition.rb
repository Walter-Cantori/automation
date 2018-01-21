Given(/^I have variable a$/) do
    @a = 50
end
    
And(/^I have variable b$/) do
    @b = 70
end
    
When(/^I add a and b$/) do
    @sum = @a + @b
end
    
Then(/^I display the sum$/) do
    puts "Sum of #{@a} and #{@b} is #{@sum}"
end