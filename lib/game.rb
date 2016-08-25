class Game
  attr_accessor :player, :computer, :deck, :input
  def initialize(name)
    @player = Player.new(name, Hand.new)
    @computer = Player.new("Dealer", Hand.new)
    @deck = Deck.new
    @input = " "
  end

  def play
    2.times do puts deal_to_player(player) end
    while players_turn
      puts player.formatted_score
      puts hit_or_stand
    end
    unless player.bust?
      puts deal_to_player(computer) while computer.wants_to_hit?
      unless computer.bust?
        puts computer.stand!
        puts computer.formatted_score
      end
    end
    puts announce_winner
    play_again?
  end

  private

  def play_again?
    print "Would you like to play again? (y/n) "
    input = get_action
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

  def deal_to_player(entity)
    "#{entity.name} was dealt #{deck.deal_to(entity.hand.cards).last.display}"
  end

  def players_turn
    !player.bust? && !player.stand?
  end

  def hit_or_stand
    get_input
    handle_input
  end

  def handle_input
    input == "h" ? deal_to_player(player) : player.stand!
  end

  def get_action
    gets.chomp.downcase
  end

  def get_input
    self.input = " "
    until 'hs'.include?(self.input)
      puts "That is not a valid choice!" if !self.input == " "
      print "Hit or Stand? (h/s) "
      self.input = get_action
    end
  end
end
