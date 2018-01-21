When(/^I open seleniumframework_practiceForm website$/) do
    visit "http://www.seleniumframework.com/Practiceform/"
end
  
When(/^I click open new browser window$/) do
    @first_window = windows.last
    puts @first_window
    click_button("button1")
end
  
Then(/^I switch to new window$/) do
    new_window = window_opened_by { click_button 'button1' }
    within_window new_window do
        expect(page).to have_css('.menu-open')
        expect(find('.menu-open')).to have_content 'MENU'
        expect(page).to have_css('.menu-open', text: 'MEN')
        expect(page.current_url).to have_content "http://www.seleniumframework.com/"
        puts page.current_url
    end
    new_window.close
end
  
  Then(/^back to parent window$/) do
    switch_to_window @first_window 
    expect(page).to have_css('#button1', text: 'New Browser Window')
    puts page.current_url
   
  end
  
  When(/^I click javascript alert window$/) do
    @message = accept_alert do
        click_button('alert')
    end
    expect(@message).to eq 'Please share this website with your friends and in your organization.'
  end
  
  Then(/^I print the text in javascript alert$/) do
    puts @message
  end
  
  When(/^I click new browser tab$/) do
    @main_tab = current_window
    @new_tab = window_opened_by {click_button 'New Browser Tab'}

  end
  
  Then(/^I switch to new tab$/) do
    switch_to_window @new_tab
    #expect(page).to have_css('a[href="http://www.seleniumframework.com/"')
    expect(page).to have_css('a[href="http://test.com/"') #forcing failure
    puts page.current_url
    
  end
  
  Then(/^back to main window$/) do
    switch_to_window @main_tab
    puts page.current_url
  end