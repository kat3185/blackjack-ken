require "pry"
require "rspec"
Dir["./lib/*.rb"].each {|file| require file }
Dir["./lib/**/*.rb"].each {|file| require file }
