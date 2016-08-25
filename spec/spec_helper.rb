require "pry"
require "rspec"
Dir["./lib/*.rb"].each {|file| require file if file != "./lib/blackjack.rb" }
