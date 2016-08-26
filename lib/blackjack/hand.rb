class Blackjack
  class Hand
    attr_reader :cards
    def initialize(cards = [])
      @cards = cards
    end

    def cards_value
      value = cards.inject(0) { |sum, card| sum + card.value }
      account_for_aces(value)
    end

    def bust?
      cards_value > 21
    end

    private
    def account_for_aces(value)
      value < 12 && contains_ace? ? value + 10 : value
    end

    def contains_ace?
      cards.any? { |card| card.is_ace? }
    end
  end
end
