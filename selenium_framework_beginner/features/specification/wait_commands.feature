# Please bear in mind that the below gherkin is NOT the way to write gherkin. This is ONLY used as a layer on top of Watir/Selenium, which
# is the focus of this training module. Cucumber gherkin has to focus on business acceptance criteria not get as technical as below

Feature: Demonstrate Waits
 Scenario: Pageload timeout
 When I open seleniumframework website
 And I set pageload timeout

 Scenario: Implicit Wait timeout
 When I open seleniumframework website
 And I set implicit timeout
 Then I print the text for target element

 Scenario: Script timeout
 When I open seleniumframework website
 And I set script timeout

 Scenario: Explicit Wait block using exists
 When I open seleniumframework website
 Then I set explicit wait block on target element using exists

 Scenario: Explicit Wait block using when present
 When I open seleniumframework website
 Then I set explicit wait block on target element using when present

 Scenario: Explicit Wait block using wait until present
 When I open seleniumframework website
 Then I set explicit wait block on target element using wait until present

 Scenario: Explicit Wait block using exists and explicit wait
 When I open seleniumframework website
 Then I set explicit wait block on target element using Wait until