Feature: Log in
    As an registrated user
    I want to login with my email and password
    so that I can use the social newtwork

Scenario: User Login successfully
    Given   I am a registered user
    And     I am on the home page
    When    I press button "Login" in navbar
    Then    I should be on "sign_in" page
    And     I fill my credentials to Login
    When    I press button "Log in"
    Then    I should be on "profile" page
    And     I should see "Signed in successfully."
