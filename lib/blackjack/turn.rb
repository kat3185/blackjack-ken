class Blackjack
  class Turn
    HIT = "h"
    VALID_OPTIONS = ['h', 's']

    attr_accessor :player, :deck, :input
    def initialize(args)
      @player = args[:player]
      @deck = args[:deck]
      @input
    end

    def take
      2.times do puts deal_to_player end
      until over?
        puts player.formatted_score
        puts hit_or_stand
      end
    end

    private

    def over?
      player.bust? || player.stand?
    end

    def deal_to_player
      "#{player.name} was dealt #{deck.deal_to(player.hand.cards).display}"
    end

    def hit_or_stand
      get_input if player.human?
      player_hits! ? deal_to_player : player.stand!
    end

    def player_hits!
      player.human? ? player_chooses_hit? : player.wants_to_hit?
    end

    def player_chooses_hit?
      input == HIT
    end

    def get_input
      self.input = invalid_input
      until VALID_OPTIONS.include?(self.input)
        puts "That is not a valid choice!" if !self.input == invalid_input
        print "Hit or Stand? (h/s) "
        self.input = get_action
      end
    end

    def invalid_input
      "#{VALID_OPTIONS}"
    end

    def get_action
      gets.chomp.downcase
    end
  end
end
