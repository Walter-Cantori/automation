Feature: Launch browser and hit seleniumframework.com

    Scenario: Open seleniumframework website and print title, url and page source
        When I open seleniumframework website
        Then I print title, url and page source