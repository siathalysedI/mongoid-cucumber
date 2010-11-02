# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "mongoid/cucumber/version"

Gem::Specification.new do |s|
  s.name        = "mongoid-cucumber"
  s.version     = Mongoid::Cucumber::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Durran Jordan"]
  s.email       = ["durran@gmail.com"]
  s.homepage    = "http://mongoid.org"
  s.summary     = "Mongoid Cucumber Steps"
  s.description = "Mongoid Cucumber Steps and Helpers for Document Creation"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "mongoid-cucumber"

  s.add_dependency("mongoid", ["~> 2.0.0.beta"])
  s.add_dependency("cucumber", ["~> 0.9"])

  s.add_development_dependency("bson_ext", ["= 1.1.1"])
  s.add_development_dependency("mocha", ["= 0.9.8"])
  s.add_development_dependency("rspec", ["= 2.0.0.beta.22"])
  s.add_development_dependency("watchr", ["= 0.7"])
  s.add_development_dependency("ruby-debug-wrapper", ["= 0.0.1"])

  s.files        = Dir.glob("lib/**/*") + %w(MIT_LICENSE README)
  s.require_path = 'lib'
end
