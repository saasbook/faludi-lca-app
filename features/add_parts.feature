Feature: View added parts
  
    As a product designer
    So I can see what I've added
    I need to see a list of my parts

Background: I am on the homepage
    Given I am on the home page
    And "Sprocket" part exists
    
Scenario: Open the sub-assemblies panel
   Then I should see "Sprocket"
    When I click "Sprocket"
    Then I should see "Name"
    Then I should see "Description"
    When I press "Cancel"
    Then I should see "Sprocket"