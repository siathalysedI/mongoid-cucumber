@table @factory
Feature: Create Root Document From Table
  In order to create a root document
  As a developer using cucumber
  I need to be able to generate a document from a table

  Scenario: Create A Document
    Given the following person document:
      | title        | dob        |
      | Grand Poobah | 1976/10/31 |

  Scenario: Create Multiple Documents
    Given the following person documents:
      | title | dob        |
      | King  | 1976/1/1   |
      | Queen | 1970/10/31 |
