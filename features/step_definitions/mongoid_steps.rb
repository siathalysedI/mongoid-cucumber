# Used for matching a step to create a root level document or documents.
#
# Syntax:
#
#   Scenario: Create A Document
#     Given the following person document:
#       | title        | dob        |
#       | Grand Poobah | 1976/10/31 |
#
#   Scenario: Create Multiple Documents
#     Given the following person documents:
#       | title | dob        |
#       | King  | 1976/1/1   |
#       | Queen | 1970/10/31 |
#
# Params:
#
# model: The name of the model to create.
# table: A Cucumber::Ast::Table.
Given %r{^the following (.+) documents?:$} do |model, table|
  pending
end
