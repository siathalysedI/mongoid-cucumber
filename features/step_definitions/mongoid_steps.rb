# Used for matching a step to create a root level document or documents.
#
# Syntax:
#
#   Scenario: Create A Document
#     Given the following person document:
#       | title        | dob        |
#       | Grand Poobah | 1976/10/31 |
#
# Params:
#
# model: The name of the model to create.
# table: A Cucumber::Ast::Table.
Given %r{^the following (.+) document:$} do |model, table|
  document = Mongoid::Cucumber::Factory.create(model, table)
  instance_variable_set("@#{model}", document)
end

Then %r{a (.+) document should be persisted with:$} do |model, table|
  pending
end
