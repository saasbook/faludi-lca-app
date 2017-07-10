Feature: Add sub-assembly

  As a product designer
  So I can organize my materials
  I need to be able to create and name sub-assembly folders

Background: Materials and Processes have been added to the database

    Given I am on the homepage
    
    Given the following Materials exist:
    | title            | category  |
    | Steel            | Metal     |
    | Copper           | Metal     |
    | Aluminum         | Metal     |
    | Concrete         | Ceramic   |
    | Glass            | Ceramic   |
    | Clay             | Ceramic   |
    | Wood             | Wood      |
    | Acids            | Chemicals |
    | Epoxy            | Polymers  |
    
    Given the following Processes exist:
    | title           | category         | material |
    | Rail            | Transportation   |          |
    | Truck           | Transportation   |          |
    | Boat            | Transportation   |          |
    | Hot Roll        | Manufacturing    | Steel    |
    | Cold Roll       | Manufacturing    | Steel    |
    | Tempering       | Manufacturing    | Steel    |

@wip
Scenario: Create a new sub-assembly
   Given I should not see "newAssembly"
   And I should see "+Assembly"
   When I press "+Assembly"
   Then I should see "newAssembly"
   
@wip
Scenario: Add name to sub-assembly
   Given I press "+Assembly"
   And I fill in "assemblyName" with "Assem1"
   Then I should see "Assem1"

