@smoke
Feature: Switch to window, pop up, frame, tab

  @critical_regression  @full_regression
  Scenario: Switch to window
    When I open seleniumframework_practiceForm website
    And I click open new browser window
    Then I switch to new window
    And back to parent window

  @full_regression
  Scenario: Switch to JavaScript Alert
    When I open seleniumframework_practiceForm website
    And I click javascript alert window
    Then I print the text in javascript alert

  @critical_regression
  Scenario: Switch to browser tab
    When I open seleniumframework_practiceForm website
    And I click new browser tab
    Then I switch to new tab
    And back to main window

  Scenario: Switch to frame
    When I open yourhtmlsource website
    Then I switch to frame and print its text
