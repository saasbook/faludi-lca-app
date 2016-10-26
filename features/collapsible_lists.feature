Feature: Materials and Processes lists should have collapsible elements

  As a user
  So that I can organize and view my Materials and Processes
  I need to be able to expand and collapse the Materials and Processes lists

Background: I visit the create model page when there are materials in the database

  Given the following materials exist:
  | title   | category |
  | Steel   | Metals   |
  | Copper  | Metals   |
  | Oak     | Wood     |
  | Birch   | Wood     |

  Given the following processes exist:
  | title       | type   |
  | Rail        | Travel |
  | Boat        | Travel |
  | Air         | Travel |
  | pressed     | Method |
  | cold-rolled | Method |

@wip
Scenario: Materials are collapsible
  When I press "+Materials"
  Then The Material Selection box should not have an option "Steel"
  And I select "Metals"
  Then The Material Selection box should have an option "Steel"
  And I deselect "Metals"
  Then The Material Selection box should not have an option "Steel"

@wip
Scenario: Materials are collapsible
  When I press "+Materials"
  Then The Material Selection box should not have an option "Birch"
  And I select "Wood"
  Then The Material Selection box should have an option "Birch"
  And I deselect "Wood"
  Then The Material Selection box should not have an option "Birch"

@wip
Scenario: Processes are collapsible
  When I press "+Process"
  Then The Material Selection box should not have an option "Rail"
  And I select "Travel"
  Then The Material Selection box should have an option "Rail"
  And I deselect "Travel"
  Then The Material Selection box should not have an option "Rail"
