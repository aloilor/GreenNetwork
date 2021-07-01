Feature: Log in
    As an registrated user
    I want to login with my email and password
    so that I can use the social newtwork

Scenario: User Login successfully
    Given   I am a registered user
    And     I am on the home page
    And     I am not authenticated
    When    I login
    And     I press button "Log in"
    Then    I should be on "profile" page
    And     I should see "Signed in successfully."
