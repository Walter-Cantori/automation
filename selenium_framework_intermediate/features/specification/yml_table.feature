@yml
Feature: Demonstrate YAML features

  Scenario: Create yaml out of a data structure
    When I create an array
    Then I print its yaml equivalent

  Scenario: Create yaml out of a json
    When I create a json string for yaml conversion
    Then I print the json yaml equivalent and dump to a file

  Scenario: Read yaml from a file
    When I read a file content into yaml
    Then I print different ways of accessing the key value pairs

  Scenario: Convert yaml to json
    When I have a yaml structure
    Then I convert it to json

  Scenario: Read row data sets using yaml and fill the web form
    When I read yaml from my data file
    Then I fill the form with data sets