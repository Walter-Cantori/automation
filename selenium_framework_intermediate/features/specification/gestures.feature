@gestures
Feature: Demonstrate Additional user gestures

  Scenario: Mouse hover
    Given I open seleniumframework website
    When I hover on Tutorials section
    And click Basic tutorial
    Then I expect to see the basic tutorial page

  Scenario: Scroll element into view
    Given I open seleniumframework practice website
    When I scroll element into view

  Scenario: Scroll element into view by lines
    Given I open seleniumframework practice website
    When I scroll element into view by lines

  Scenario: Right click
    Given I open seleniumframework practice website
    When I right click on alert element

  Scenario: Double Click
    Given I open seleniumframework practice website
    When I double click on element
    Then it changes color

  Scenario: Right click and arrow down
    Given I open practiceselenium website
    When I right click on welcome and copy link address