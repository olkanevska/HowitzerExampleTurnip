@signup_steps
Feature: Sign Up
  As a user
  I want to sign up to the system
  So I can login with a new account

  @smoke
  Scenario: user can open sign up page via menu
    Given home page of web application
    When I click register menu item on home page
    Then I should be redirected to sign_up page

  @smoke
  Scenario: user can initiate sign up
    Given login page of web application
    When I click sign link on login page
    Then I should be redirected to sign_up page

  @smoke
  Scenario: user can sign up with correct credentials
    Given sign_up page of web application
    When I fill form on sign up page with new data
    And I submit sign up form on sign up page
    Then I should be redirected to home page
    And I should be logged in the system

  @p1
  Scenario: user can not sign up with blank data
    Given sign_up page of web application
    When I fill form on sign up page with blank data
    And I submit sign up form on sign up page
    Then I should see following text 'Please review the problems below' on sign_up page
    When I am navigating on home page
    And I should not be logged in the system

  @p1
  Scenario: user can not login with short password
    Given sign_up page of web application
    When I fill form on sign up page with short password
    And I submit sign up form on sign up page
    Then I should see following text 'is too short (minimum is 8 characters)' on sign_up page
    When I am navigating on home page
    And I should not be logged in the system

  @p1
  Scenario: user can not login with different password data
    Given sign_up page of web application
    When I fill form on sign up page with different password data
    And I submit sign up form on sign up page
    Then I should see following text "doesn't match Password" on sign_up page
    And I am navigating on home page
    And I should not be logged in the system
