require_relative "blackjack/deck"
require_relative "blackjack/hand"
require_relative "blackjack/game"
require_relative "blackjack/player"
require_relative "blackjack/turn"

class Blackjack
 def self.play
   puts "Welcome to Blackjack!"
   print "What's your name? "
   name = gets.chomp.capitalize
   game = Blackjack::Game.new(name: name)
   game.play
 end
end
