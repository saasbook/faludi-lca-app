Feature: Add Quantity of a Material 
    
    As a product designer
    So that I can specify quantities of Materials
    I need to add set amounts of Materials 

Background: On Homepage
    Given I am on the homepage
    And "Steel" material exists
    
    
Scenario: Add Quantity
    When I fill in "Quantity" with "10"
    Then I should see "10"
    
    
