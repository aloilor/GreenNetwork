Feature: Add a Post
    As an registered user
    I can add a new Post

Scenario: Add a post
    Given   I am a registered user
    And     I am authenticated
    When    I press icon in navbar to add new post
    Then    I should be on "new" page
    When    I fill in Form title with "Title test", "Description Test", "Position Test", "Post"
    And     I press button "Submit"
    Then    I should be on "home" page
    And     I should see "Post created successfully"
    
    