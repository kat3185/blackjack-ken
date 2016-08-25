class Blackjack
  class Player
    attr_accessor :name, :hand
    def initialize(args)
      @name = args[:name]
      @hand = args[:hand]
      @human = args[:human] || false
      @stand = false
    end

    def stand!
      @stand = true
      "#{name} stands!\n\n"
    end

    def human?
      @human
    end

    def stand?
      @stand
    end

    def score
      hand.cards_value
    end

    def formatted_score
      "#{name}'s score: #{score}\n\n"
    end

    def bust?
      hand.bust?
    end

    def wants_to_hit?
      score < 17
    end

    def wins!
      "#{name} wins!"
    end
  end
end
