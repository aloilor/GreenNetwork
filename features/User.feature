Feature: User
    As an registered user
    I want to change my username

Scenario: Change Username
    Given   I am a registered user
    And     I am authenticated
    Given   I am in my profile page
    And     I press button "Settings"
    Then    I should be on 'edit_user_registration_path' page
    And     I fill in username with "new Username" 
    And     I confirm with my password
    When    I press button "Update"
    Then    I should be on 'users' page
    And     I should see "Your account has been updated successfully."
    
    