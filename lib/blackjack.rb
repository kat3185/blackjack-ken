require_relative "deck"
require_relative "hand"
require_relative "game"
require_relative "player"

puts "Welcome to Blackjack!"
print "What's your name? "
name = gets.chomp.capitalize
game = Game.new(name)
game.play
