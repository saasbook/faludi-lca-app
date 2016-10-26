Feature: Use search bar
 
  As a user
  So that I can find custom Materials and Processes
  I need to be able to see available options using the search bar


Background: materials and processes have been added to database

  Given the following materials and processes exist:
  | name            | type     | 
  | copper          | material |
  | steel           | material |
  | ceramics        | material |
  | rail            | processes|
  | car             | processes|
  | hot-rolled      | processes|
  | cold-rolled     | processes|

@wip
Scenario: see search bar after clicking materials button
  Given I am on the modelPage
  When I press "materials"
  Then I should see "Select a material"
  
@wip
Scenario: see search bar after clicking manufacturing button
  Given I am on the modelPage
  And I press "materials"
  And I fill in "materialsSearch" with "steel"
  And I press "add"
  When I press "+ Manufacturing"
  Then I should see "Select a method"
  
@wip
Scenario: see search bar after clicking transport button
  Given I am on the modelPage
  And I press "materials"
  And I fill in "materialsSearch" with "steel"
  And I press "add"
  When I press "+ Transport"
  Then I should see "Select a method"