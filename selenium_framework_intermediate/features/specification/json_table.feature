@json
Feature: Demonstrate the json data formats

  Scenario: Create a json string and access it as hash
    When I create a json string
    Then I parse the string and print keys and values

  Scenario: Create another json string and access it as hash
    When I create another json string
    Then I parse the string and print its data

  Scenario: Write json to a file
    When I create another json string
    Then I persist it to a file

  Scenario: Access a json string in a file
    When I read json string from a file

  Scenario: Accessing a json data file and filling the web form
    When I open practiceselenium website
    And I read the json data file "practiceform.json"
    And I fill the form with data from json and submit