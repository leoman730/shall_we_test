Feature: Showing examples on how to write test cases for cucumber
 	As some of you new to cucumber, I will show you how to write
 	some cucumber test cases

    Scenario: Verify Page Title
      Given I am on http://google.com
      Then I should see a title 'Google'
      And run