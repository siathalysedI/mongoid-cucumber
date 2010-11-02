require "mongoid"
require "mocha"
require "rspec"

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

MODELS = File.join(File.dirname(__FILE__), "models")
$LOAD_PATH.unshift(MODELS)

require "mongoid/cucumber"

Mongoid.configure do |config|
  name = "mongoid_cucumber_test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end

Dir[ File.join(MODELS, "*.rb") ].sort.each { |file| require File.basename(file) }

RSpec.configure do |config|
  config.mock_with :mocha
end
