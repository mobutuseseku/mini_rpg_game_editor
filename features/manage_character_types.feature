Feature: Manage Character Types
  In order to make a rpg game editor
  As an user
  I want to create and manage characters types
  
  Scenario: Characters List
    Given I am loged in as User
    Given I have character types named Warrior, Mage
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"

  Scenario: Create Character Type with valid data provided
    Given I am loged in as User
    Given I have no character types
    And I am on the list of character types
    When I follow "Create Character Type"
    Then I should see "New Character Type"
    And I fill in "Name" with "Warrior"
    And I attach Avatar 
    And I click "Create Character type"
    Then I should see "New character type created."
    And I should see "Warrior"
    And I should have 1 character type

  Scenario: Prevent Create Character Type if invalid data provided 
    Given I am loged in as User
    Given I have no character types
    And I am on the list of character types
    When I follow "Create Character Type"
    Then I should see "New Character Type"
    And I fill in "Name" with ""
    And I click "Create Character type"
    Then I should see "2 errors prohibited this character type from being saved: Name can't be blank Character avatar can't be blank"
    And I should have 0 character type

  Scenario: Show Caracter Type
    Given I am loged in as User
    Given I have character types named Warrior, Mage
    When I go to the list of character types
    Then I should see "Warrior"
    And I follow first "Warrior"
    Then I should see "Character Type"
    And I should see "Character Type: Warrior"

  Scenario: Edit Caracter Type
    Given I am loged in as User
    Given I have character types named Warrior, Mage, Warrior
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"
    And I should see "Warrior"
    When I click on option "Edit" on first "Warrior" 
    Then I should see "Edit Character Type"
    And I fill in "Name" with "Warlock"
    And I click "Update Character type"
    Then I should see "Character type successfuly updated."
    And I should see "Warlock"
    And I should see "Mage"
    And I should see "Warrior"
    And I should have 3 character type
  
  @javascript
  Scenario: Destroy Caracter Type
    Given I am loged in as User
    Given I have character types named Warrior, Mage, Warrior
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"
    When I click on option "Delete" on first "Warrior" 
    Then I see popup "Are you sure?"
    Then I confirm popup
    And I should see "Mage"
    And I should have 2 character type