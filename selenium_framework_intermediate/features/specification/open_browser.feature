@browsers
Feature: test different browsers

Scenario: I am able to open firefox
  Given I open seleniumframerok site in "firefox"
  Then Browser opens showing correct title

Scenario: I am able to open firefox
  Given I open seleniumframerok site in "chrome"
  Then Browser opens showing correct title