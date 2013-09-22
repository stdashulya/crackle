Feature: Auth
  As visitor
  I want to sign up and manage my account

  Scenario: User must to sign in for viewing homepage
    When I go to the homepage
    Then I should see "Sign in"

  Scenario: User should be able to sign up
    When I go to the register page
    Then I should see "Sign up"
    When I fill in "user_email" with "dummy@dummy.com"
    And I fill in "user_username" with "dummy"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    And I press "Sign up"
    Then I should see "Hello, dummy"
    And I should see "Your email is: dummy@dummy.com"

  Scenario: User should see errors when sign up
    When I go to the register page
    Then I should see "Sign up"
    When I fill in "user_email" with "dummy@dummy.com"
    And I press "Sign up"
    Then I should see "Password can't be blank"
    And I should see "Username can't be blank"

  Scenario: User should be able to sign in
    Given A user exists with email "dummy@dummy.com" and password "password"
    When I go to the login page
    Then I should see "Sign in"
    When I fill in "user_email" with "dummy@dummy.com"
    And I fill in "user_password" with "password"
    And I press "Sign in"
    Then I should see "Hello, chuck"
    And I should see "Your email is: dummy@dummy.com"

  Scenario: User should be able to edit profile
    Given A logged in user
    When I follow "Edit profile"
    When I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I fill in "user_current_password" with "example"
    And I press "Update"
    Then I should see user's name
