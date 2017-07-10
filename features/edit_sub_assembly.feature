Feature: Edit sub-assembly

  As a product designer
  So I can organize my sub assemblies
  I need to be able to edit, add, and delete items from sub assembly folders

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
Scenario: Drag items into sub-assembly folder
  Given I press "+Assembly"
  And I fill in "assemblyName" with "Assem1"
  When I drag "Steel" to "Assem1"
  Then I should not see "Steel"