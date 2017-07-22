Feature: Organize sub-assembly

  As a product designer
  So I can organize my sub-assemblies for my product
  I need to be able to re-order and delete sub-assemblies

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

  And I press "+Assembly"
  And I fill in "assemblyName" with "Assem1"
  And I press "+Assembly"
  And I fill in "assemblyName" with "Assem2"

@wip
Scenario: A second sub-assembly is added
  Then I should see "Assem1" above "Assem2"


@wip
Scenario: Re-order sub-assembly folders
  Given I drag "Steel" to "Assem1"
  And I drag "Acids" to "Assem2"
  When I drag "Assem2" above "Assem1"
  Then I should see "Assem2" above "Assem1"
  And I should see "Acids" above "Steel"

@wip
Scenario: Delete sub-assembly folder by dragging
  Given I drag "Steel" to "Assem1"
  When I delete "Assem1"
  Then I should not see "Assem1"

