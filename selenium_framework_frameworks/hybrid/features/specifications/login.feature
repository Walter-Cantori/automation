@login
Feature: Login to portal

    Scenario: Login and logout
        When I open automationpractice website
        And I login with username "test1010@test.com" and password "test1234"
        Then I verify that I successfully logged in by logging out

    Scenario: Login invalid user
        When I open automationpractice website
        And I login with username "test1010@test.com" and password "test12345"
        Then I verify that I receive a failure message
        