Given(/^I open seleniumframework website$/) do
  visit "http://www.seleniumframework.com/"
end

When(/^I hover on Tutorials section$/) do
  expect(page).to have_xpath(".//*[@id='main-nav']/li[2]/ul/li[2]/a", visible: false) #hidden tutorial sub menu item
  find(:xpath, "//*[@id='main-nav']/li[2]/a/span").hover #hover tutorial menu
  expect(page).to have_xpath(".//*[@id='main-nav']/li[2]/ul/li[2]/a", visible: true) #hidden tutorial sub menu item visible
end

When(/^click Basic tutorial$/) do
  sub_menu_item_tutorial_ruby_basic = ".//*[@id='main-nav']/li[2]/ul/li[2]/ul/li[1]/a/span"
  sub_menu_item_tutorial = "//*[@id='main-nav']/li[2]/a/span"
  sub_menu_item_tutorial_ruby = ".//*[@id='main-nav']/li[2]/ul/li[2]/a"

  expect(page).to have_xpath(sub_menu_item_tutorial_ruby_basic, visible: false) 
  find(:xpath, sub_menu_item_tutorial).hover
  expect(page).to have_xpath(sub_menu_item_tutorial_ruby_basic, visible: false)
  find(:xpath, sub_menu_item_tutorial_ruby).hover
  expect(page).to have_xpath(sub_menu_item_tutorial_ruby_basic, visible: true)
  click_link('Selenium Basic Tutorial')
  
end

Then(/^I expect to see the basic tutorial page$/) do
  expect(page).to have_title('Selenium Framework | What is Ruby?')
end

Given(/^I open seleniumframework practice website$/) do
  visit "http://www.seleniumframework.com/Practiceform/"
end

When(/^I scroll element into view$/) do
  page.execute_script('document.getElementById("draga").scrollIntoView(true)')
  page.execute_script('document.getElementById("draga").scrollIntoView(false)')
end

When(/^I scroll element into view by lines$/) do
  page.execute_script('window.scrollBy(0, 50)')
end

When(/^I right click on alert element$/) do
  find('#alert').right_click
end

When(/^I double click on element$/) do
  color = find('#doubleClick').native.css_value('color')
  expect(color).to have_content("255, 255, 255")
  find("#colorVar").click
  element = find('#doubleClick')
  
  page.driver.browser.action.double_click(element.native).perform #not working
  
end

Then(/^it changes color$/) do
  color = find('#doubleClick').native.css_value('color')
  expect(color).to have_content("255, 165, 0") #not working
  
end

When(/^I right click on welcome and copy link address$/) do
  pending # Write code here that turns the phrase above into concrete actions
end