require_relative "card"
class Deck
  SUITS = ["♠", "♥", "♦", "♣"]
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  attr_reader :cards
  def initialize
    @cards = make_cards
  end

  def deal_to(player_cards)
    player_cards << cards.pop
  end

  private
  def make_cards
    SUITS.map {|suit| RANKS.map {|rank| Card.new(rank, suit)}}.flatten.shuffle!
  end
end
