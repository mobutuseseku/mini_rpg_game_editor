Feature: Manage Character Attributes
  In order to manage character attributes
  As an user
  I want to create and manage characters attributes

  Scenario: List Character Attributes
    Given I am loged in as User
    Given I have character types named Warrior, Mage
    Given Charactes have attributes
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"
    And I follow first "Warrior"
    Then I should see "Character Attributes"
    And I should see char attr avatar for "Speed" "30" of "Warrior"
    And I should see char attr avatar for "Strength" "40" of "Warrior"

  @javascript
  Scenario: Add Character Attribute
    Given I am loged in as User
    Given I have character types named Warrior, Mage, Warrior
    Given Charactes have attributes
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"
    And I should see "Warrior"
    And I follow first "Warrior"
    Then I should see "Add Attribute"
    And I follow "Add Attribute"
    And I fill out the attribute form
    Then I click "Save"
    And I should have 1 "more" character attribute on "Warrior"

  @javascript
  Scenario: Edit Character Attribute
    Given I am loged in as User
    Given I have character types named Warrior, Mage
    Given Charactes have attributes
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"
    And I follow first "Warrior"
    Then I should see "Speed"
    When I click "Edit" at the end of "Speed" attribute of "Warrior"
    Then I should see "Character Attributes"
    And I edit attributes "Name" "Speed" with "Strength" and "Numerical Value" with 60
    Then I click "Save"
    And I should see "Strength"
    And I should see "60"

  @javascript
  Scenario: Delete Character Attribute
    Given I am loged in as User
    Given I have character types named Warrior, Mage
    Given Charactes have attributes
    And I am on "Warrior" page
    Then I should see "Character Attributes"
    And I should see "Speed"
    And I should see "30"
    When I click "Delete" at the end of "Speed" attribute of "Warrior"
    Then I see popup "Are you sure?"
    Then I confirm popup
    When I am on "Warrior" page
    And I should have 1 "less" character attribute on "Warrior"


