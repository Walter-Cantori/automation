Feature: Explaining browser commands

    Scenario: Print the browser name
        When I open uol website
        Then I print the browser name

    Scenario: Print the ready state
        When I open uol website
        Then I print the browser ready state

    Scenario: Browser back, forward and refresh
        When I open uol website
        And I click ABOUT link
        Then I click back on the browser
        And I click forward on the browser
        And I click refresh on the browser