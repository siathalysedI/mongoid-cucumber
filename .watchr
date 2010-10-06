# vim:set filetype=ruby:
def run(cmd)
  puts cmd
  system cmd
end

def feature(file)
  run("cucumber #{file}") if File.exists?(file)
end

def spec(file)
  run("rspec #{file}") if File.exists?(file)
end

watch("spec/.*/*_spec\.rb") do |match|
  puts(match[0])
  spec(match[0])
end

watch("lib/(.*/.*)\.rb") do |match|
  puts(match[1])
  spec("spec/#{match[1]}_spec.rb")
end

watch("features/.*.feature") do |match|
  puts(match[0])
  feature(match[0])
end
