require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new }
  let(:king) { Card.new("K", "♠") }
  let(:ace) { Card.new("A", "♠") }
  let(:card) { Card.new(9, "♠") }
  let(:five) { Card.new(5, "♠") }

  describe '#initialize' do
    it "has an array of cards" do
      expect(hand.cards.class).to be(Array)
      expect(hand.cards).to eq([])
    end
  end

  describe '#contains_ace?' do
    it "returns false if the hand contains no ace" do
      hand.cards << king
      expect(hand.contains_ace?).to eq(false)
    end
    it "returns false if the hand contains no ace" do
      hand.cards << ace
      expect(hand.contains_ace?).to eq(true)
    end
  end

  describe '#account_for_aces' do
    it "adds 10 to the hand value if value is under 12 with an ace in hand" do
      hand.cards << ace
      expect(hand.account_for_aces(10)).to eq(20)
    end
    it "adds 10 to the hand value if value is under 12 with an ace in hand" do
      hand.cards << ace
      expect(hand.account_for_aces(12)).to eq(12)
    end
  end

  describe '#cards_value' do
    it "sums the value of the cards in the hand correctly" do
      hand.cards << king
      expect(hand.cards_value).to eq(10)
      hand.cards << ace
      expect(hand.cards_value).to eq(21)
      hand.cards << five
      expect(hand.cards_value).to eq(16)
    end
  end
  describe '#bust?' do
    it "returns false if value is 21 or lower" do
      hand.cards << king
      expect(hand.bust?).to eq(false)
      hand.cards << ace
      expect(hand.bust?).to eq(false)
    end
    it "returns true if value is 22 or higher" do
      hand.cards << king
      expect(hand.bust?).to eq(false)
      hand.cards << king
      hand.cards << king
      expect(hand.bust?).to eq(true)
    end
  end
end
