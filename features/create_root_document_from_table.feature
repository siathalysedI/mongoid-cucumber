@table @factory
Feature: Create Root Document From Table
  In order to create a root document
  As a developer using cucumber
  I need to be able to generate a document from a table

  Scenario: Create A Document
    Given the following person document:
      | title        | dob        |
      | Grand Poobah | 1976/10/31 |
    Then a person document should be persisted with:
      | title        | dob        |
      | Grand Poobah | 1976/10/31 |
