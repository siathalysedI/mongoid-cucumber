require "mongoid/cucumber"

# Used for adding the <tt>factory</tt> and <tt>matchers</tt> convenience
# methods to the cucumber world.
World do
  Mongoid::Cucumber::World.new
end
