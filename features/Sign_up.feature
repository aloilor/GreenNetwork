Feature: Sign up
    As an unregistrated user
    I want to sign up with my email and password
    so that I can become an registered user

Scenario: Sign up
    Given   I am on the home page
    When    I press button "Sign-up" in navbar
    Then    I should be on "sign_up" page 
    And     I fill my credentials to SignUp
    When    I press button "Sign up"
    Then    I should be on "profile" page
    And     I should see "Welcome! You have signed up successfully."
