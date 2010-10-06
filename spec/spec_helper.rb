$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "mongoid"
require "mocha"
require "rspec"

Mongoid.configure do |config|
  name = "mongoid_cucumber_test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end

Rspec.configure do |config|
  config.mock_with :mocha
end
