Feature: Create a Sub Assembly with Materials
  
    As a product designer
    So that I can materials to my sub-assembly
    I want to be able to open a menu for sub_assemblies

Background: On Homepage
    Given I am on the homepage

Scenario: Open the sub-assembly menu
    When I press "+Sub-Assembly"
    Then I should see "Name"
    And I should see "Description"

Scenario: Make a sub-assembly
    When I press "+Sub-Assembly"
    When I fill in "Name" with "Sub-Assembly12"
    And I fill in "Description" with "A New Sub-Assembly"
    And I press "Steel"
    And I press "Submit"
    Then I should see "Sub-Assembly12"
    
# Feature: Create a Sub Assemblies using existing Models
  
#   As a product designer
#   So I can create Models
#   I want to use existing Parts to make Models
  
# Background: On Homepage
#   Given I am on the homepage
	
# Scenario: Create a Sub Assembly
#   When I press "+Assembly"
#   And I fill in ""
#   And I press "Add"
#   Then I should see "Steel"
#   And I should see "32 kg"
  
# Scenario: Add Parts to Sub Assembly
#   When I press "+Material"
#   And I enter "Steel" with 32 kg
#   And I press "Add"
#   Then I press "+Material"
#   And I enter "Glass" with 5 kg
#   And I press "Add"
#   Then I should see "Steel"
#   And I should see "32 kg"
#   And I should see "Glass"
#   And I should see "5 kg"
  
# Scenario: Cancel an add
#   When I press "+Material"
#   And I enter "Steel" with 32 kg
#   And I press "Cancel"
#   Then I should not see "Steel"
  