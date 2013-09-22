Feature: Home
  As logged in user
  I want to see home page

  Background:
    Given A logged in user

  Scenario: User should be able to see his info
    When I go to the homepage
    Then I should see user's name
    And I should see user's email

  Scenario: User should be able to see users page
    Given 3 users exist
    When I go to the users page
    Then I should see all users
