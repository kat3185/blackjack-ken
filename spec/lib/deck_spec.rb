require "spec_helper"

RSpec.describe Deck do
  let(:deck) { Deck.new }

  describe '#initialize' do
    it "has an array of 52 card objects" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards.first).to be_a(Card)
    end
  end

  describe '#deal_to' do
    it "adds a card to an array and returns that array" do
      last_card = deck.cards.last
      expect(deck.deal_to([])).to eq(last_card)
    end
  end
end
