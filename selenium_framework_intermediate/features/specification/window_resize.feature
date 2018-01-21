@resize
Feature: Launch browser and open www.seleniumframework.com and resize

  Scenario: open seleniumframework website and resize window
    When I resize window with "300" and "768" and print title
    Then I print title url and page source