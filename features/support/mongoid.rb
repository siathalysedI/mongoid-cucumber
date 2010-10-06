require "mongoid"
require "mongoid/cucumber"

Mongoid.configure do |config|
  name = "mongoid_cucumber_test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end

Mongoid.master.collections.select do |collection|
  collection.name !~ /system/
end.each(&:drop)

class Person
  include Mongoid::Document
  field :title, :type => String
  field :dob,   :type => Date
end
