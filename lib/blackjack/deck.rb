require_relative "card"
class Blackjack
  class Deck
    SUITS = ["♠", "♥", "♦", "♣"]
    RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    attr_reader :cards
    def initialize
      @cards = make_cards
    end

    def deal_to(player_hand)
      card = cards.pop
      player_hand << card
      card
    end

    private
    def make_cards
      SUITS.map {|suit| RANKS.map {|rank| Card.new(rank: rank, suit: suit)}}.flatten.shuffle!
    end
  end
end
