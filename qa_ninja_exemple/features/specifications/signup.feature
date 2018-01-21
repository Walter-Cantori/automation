Feature: Users Signup


Scenario: Success signup
    Given I access dtvdashboard
    When I enter valid credentials
    And Click on submit
    Then access should be granted

Scenario: Unsuccessful signup
    Given I access dtvdashboard
    When I enter invalid credentials
    And Click on submit
    Then I should see an error message

