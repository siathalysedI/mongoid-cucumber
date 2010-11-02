@table @factory
Feature: Create Root Documents From Table
  In order to create multiple root documents
  As a developer using cucumber
  I need to be able to generate multiple documents from a table

  Scenario: Creating Multiple Root Documents
    Given the following person documents:
      | title        | dob        |
      | Grand Poobah | 1976/10/31 |
      | Master       | 1976/09/15 |
    Then person documents should be persisted with:
      | title        | dob        |
      | Grand Poobah | 1976/10/31 |
      | Master       | 1976/09/15 |
