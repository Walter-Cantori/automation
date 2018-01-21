When(/^I open practiceselenium\.com website$/) do
    visit "http://www.practiceselenium.com/practice-form.html"
end
  
  Then(/^I find first and last name and print the html$/) do
    fname = find('[name=firstname]')
    fname.set('first name')
    fill_in('lastname', with: "last name")
  end
  
  Then(/^I find menu and print the html$/) do
    menu_link = find('[data-title=Menu')
    menu_link.click
  end
  
  Then(/^I find button and print the html$/) do
    button = find('#submit')
    puts button.text
    expect(button.text).to eq('OK')
  end
  
  Then(/^I find radio button male and print the html$/) do
    choose('Female')
    radio = find('#sex-1')
    puts radio.value
  end
  
  Then(/^I find check box and print the html$/) do
    check1 = find(:xpath, ".//*[@id='tea1']")
    check1.set(true)

    check2 = find("#tea3")
    puts check2.value
    check2.click
  end
  
  Then(/^I find select list and print html$/) do
    select('Asia', from: 'continents')
    continents = find("#continents").all('option').collect(&:text)
   # puts continents

    continents2 = page.execute_script("
      var options = document.querySelectorAll('#continents option')
      var result = []
      for(var i = 0; i < options.length; i++){
        result.push(options[i].innerHTML)
      }
      return result
    ")
    puts continents2
  end
  
  Then(/^I find another select list and print html$/) do
    select('Switch Commands', from: 'selenium_commands')
    sleep(2)
    page.execute_script("
      document.querySelector('#selenium_commands').value='Wait Commands';
    ")
    sleep(1)
  end
  
  Then(/^I find div and print html$/) do
    div = find(:xpath, ".//*[@id='selenium_commands']")['innerHTML']
    puts div
  end