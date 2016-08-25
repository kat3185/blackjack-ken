class Blackjack
  class Game
    attr_accessor :player, :computer, :deck, :input
    def initialize(name)
      @player = Player.new(name: name, hand: Hand.new, human: true)
      @computer = Player.new(name: "Dealer", hand: Hand.new, human: false)
      @deck = Deck.new
      @input = " "
    end

    def play
      player_turn = Turn.new(player: player, deck: deck)
      player_turn.take
      computer_turn = Turn.new(player: computer, deck: deck)
      computer_turn.take unless player.bust?
      puts announce_winner
      play_again?
    end

    private

    def play_again?
      print "Would you like to play again? (y/n) "
      input = gets.chomp.downcase
      input == "y" ? Game.new(player.name).play : puts("Have a nice life now!")
    end

    def announce_winner
      if player.bust?
        "Bust! " + computer.wins!
      elsif computer.bust?
        "Bust! " + player.wins!
      elsif player.score == computer.score
        "It's a tie! |-o-|\n" + computer.wins!
      elsif player.score > computer.score
        player.wins!
      else
        computer.wins!
      end
    end
  end
end
