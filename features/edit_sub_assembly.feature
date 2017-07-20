Feature: Edit sub-assembly

  As a product designer
  So I can organize materials in my sub assemblies
  I need to be able to add and delete items from sub-assembly folders

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

  And I press "Add Subassembly"
  And I fill in "subassembly" with "Assem1"


@wip
Scenario: Add items into sub-assembly folder
  When I drag "Steel" to "Assem1"
  Then I should see "Steel" in "Assem1"

@wip
Scenario: Delete items from sub-assembly folder
  Given I drag "Steel" to "Assem1"
  When I delete "Steel"
  Then I should not see "Steel" in "Assem1"

@wip
Scenario: Delete subassembly
  When I delete "Assem1"
  Then I should not see "Assem1"

@wip
Scenario: Save subassembly
  Given I drag "Steel" to "Assem1"
  And I press "Save"
  And I follow "Profile"
  Then I should be on profilepage
  And I follow "Current Assembly"
  Then I should see "Assem1"
  And I should see "Steel" in "Assem1"


