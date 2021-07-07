Feature: Post
    As an registered user
    I want add a new Post
    I want update a my Post
    

Scenario: Add a post
    Given   I am a registered user
    And     I am authenticated
    When    I press icon in navbar to add new post
    Then    I should be on "new" page
    When    I fill in title with "Title test", "Description Test", "Position Test", "Post"
    And     I press button "Submit"
    Then    I should be on "home" page
    And     I should see "Post created successfully"
    
Scenario: Update a Post
    Given   I am a registered user
    And     I am authenticated
    And     I am on the home page
    When    I press a title of one my Post
    #Then    I should be on the show post page
    And     I press button "Edit"
    Then    I fill in title with "New Title", "new Description", "new Position Test", "Event"
    And     I press button "Submit"
    Then    I should be on "home" page
    And     I should see "Post updated succesfully"
 