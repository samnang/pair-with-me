Feature: User authentication
  In order to setup pair schedules
  As a user
  I want to login with my username and setup my profile

  Scenario: User Sign up
    Given I am not logged in
    When I go to the sign up page
    And I fill in "User" with "foo"
    And I fill in "Email" with "foo@test.com"
    And I fill in "Password" with "foobar"
    And I fill in "Password confirmation" with "foobar"
    And I press "Sign up"
    Then I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."

  Scenario: User Sign in
    Given I am not logged in
    And I am a user named "foo" with an email "foo@test.com" and password "foobar"
    When I go to the sign in page
    And I fill in "Username or email" with "foo"
    And I fill in "Password" with "foobar"
    And I press "Log in"
    Then I should see "Signed in successfully."
    When I go to the sign in page
    Then I should be already signed in
    And I should be on the home page
