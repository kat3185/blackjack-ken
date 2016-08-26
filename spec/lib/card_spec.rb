require "spec_helper"

RSpec.describe Blackjack::Card do
  let(:king) { Blackjack::Card.new(rank: "K", suit:"♠") }
  let(:ace) { Blackjack::Card.new(rank: "A", suit: "♠") }
  let(:card) { Blackjack::Card.new(rank: 9, suit: "♠") }
  let(:five) { Blackjack::Card.new(rank: 5, suit: "♠") }

  class Blackjack::Card
    public :is_facecard?
  end

  describe '#initialize' do
    it "has a rank and a suit" do
      expect(card.rank).to eq(9)
      expect(card.suit).to eq("♠")
    end
  end

  describe '#display' do
    it "returns rank and suit together as a string" do
      expect(card.display).to eq("9♠")
    end
  end

  describe '#is_ace?' do
    it "returns true if the card is an ace" do
      expect(ace.is_ace?).to eq(true)
    end
    it "returns false if the card is not an ace" do
      expect(card.is_ace?).to eq(false)
      expect(king.is_ace?).to eq(false)
    end
  end

  describe '#is_facecard?' do
    it "returns true if the card is a facecard" do
      expect(king.is_facecard?).to eq(true)
    end
    it "returns false if the card is not a facecard" do
      expect(ace.is_facecard?).to eq(false)
      expect(card.is_facecard?).to eq(false)
    end
  end

  describe '#value' do
    it 'returns 10 for a facecard' do
      expect(king.value).to eq(10)
    end
    it 'returns 1 for an ace' do
      expect(ace.value).to eq(1)
    end
    it 'returns the number value for other cards' do
      expect(card.value).to eq(9)
      expect(five.value).to eq(5)
    end
  end
end
