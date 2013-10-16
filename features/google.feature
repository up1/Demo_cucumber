Feature: Google search

Scenario: Search for up1
   Given I am on google search page
   When I want to search "up1"
   Then I should see "somkiat"

