require "mongoid"

Mongoid.configure do |config|
  name = "mongoid_cucumber_test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end
