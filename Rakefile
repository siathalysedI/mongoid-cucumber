require "bundler"
Bundler.setup

require "rake"
require "rspec"
require "rspec/core/rake_task"
require "cucumber/rake/task"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "mongoid/cucumber/version"

task :build do
  system "gem build mongoid-cucumber.gemspec"
end

task :install => :build do
  system "sudo gem install mongoid-cucumber-#{Mongoid::Cucumber::VERSION}.gem"
end

task :release => :build do
  system "git tag -a #{Mongoid::Cucumber::VERSION} -m 'Tagging #{Mongoid::Cucumber::VERSION}'"
  system "git push --tags"
  system "gem push mongoid-cucumber-#{Mongoid::Cucumber::VERSION}.gem"
end

Rspec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end

task :default => [:spec, :cucumber]
