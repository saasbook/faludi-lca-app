Feature: display homepage

    As a product designer
    So that I can see features available in the program
    I want to see a homepage with various buttons and functions

Background: Materials and Processes have been added to the database

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

Scenario: Homepage
   Scenario: Initial Home Page
       Given I am on the homepage
       Then I should see "Materials"
       And I should see "Manufacturing"
       And I should see "Transport"
       And I should see "Use"
       And I should see "End of Life"
       And I should see "Assembly"
       And I should see "Materials"

       And I should not see "Drop your Steel processes here."
       And I should not see "Drop your Copper processes here."
       And I should not see "Drop your Aluminum processes here."
       And I should not see "Drop your Steel processes here."
       And I should not see "Drop your Epoxy processes here."
       And I should not see "Drop your Glass processes here."
       And I should not see "Drop your Clay processes here."


   Scenario: View Collapsible Materials
      Given I am on the homepage
      When I choose "Materials" from Library
      And I should see "Chemicals"
      And I should see "Metal"
      And I should see "Polymers"
      And I should see "Wood"

      When I choose "Ceramic" from "Materials" submenu in Library
      Then I should see "Clay"
      And I should see "Concrete"
      And I should see "Glass"

   Scenario: View Collapsible Processes
      Given I am on the homepage
      When I choose "Manufacturing" from Library
      Then I should see "Ceramic"
      And I should see "Chemicals"
      And I should see "Metal"
      And I should see "Polymers"
      And I should see "Wood"
      And I should see "Polymers"

      When I choose "Steel" from "Manufacturing" submenu in Library
      Then I should see "Hot Roll"
      And I should see "Cold Roll"


Scenario: Adding Materials
   @javascript
   Scenario: - Concrete
      Given I am on the homepage
      When I choose "Ceramic" from "Materials" submenu in Library
      And I should see "Concrete"
      And I move "Concrete" from "Materials" to my Assembly

      Then I should see "Drop your Concrete processes here."

      And I should not see "Drop your Steel processes here."
      And I should not see "Drop your Copper processes here."
      And I should not see "Drop your Aluminum processes here."
      And I should not see "Drop your Steel processes here."
      And I should not see "Drop your Epoxy processes here."
      And I should not see "Drop your Glass processes here."
      And I should not see "Drop your Clay processes here."

   @javascript
   Scenario: - Multiple Materials
      Given I am on the homepage
      # 1
      When I choose "Ceramic" from "Materials" submenu in Library
      And I move "Concrete" from "Materials" to my Assembly

      #2
      When I choose "Metal" from "Materials" submenu in Library
      And I move "Steel" from "Materials" to my Assembly

      # 3
      When I choose "Ceramic" from "Materials" submenu in Library
      And I move "Concrete" from "Materials" to my Assembly

      # Happy
      Then I should see "2" instances of "Drop your Concrete processes here."
      And I should see "Drop your Steel processes here."

      #Sad
      And I should not see "Drop your Copper processes here."
      And I should not see "Drop your Aluminum processes here."
      And I should not see "Drop your Epoxy processes here."
      And I should not see "Drop your Glass processes here."
      And I should not see "Drop your Clay processes here."
