require "spec_helper"

RSpec.describe Blackjack::Player do
  let(:hand) { Blackjack::Hand.new }
  let(:king) { Blackjack::Card.new("K", "♠") }
  let(:ace) { Blackjack::Card.new("A", "♠") }
  let(:card) { Blackjack::Card.new(9, "♠") }
  let(:five) { Blackjack::Card.new(5, "♠") }
  let(:player) { Blackjack::Player.new(name: "Ken", hand: hand, human: true) }
  let(:dealer) { Blackjack::Player.new(name: "Dealer", hand: hand) }

  describe '#initialize' do
    it "has a name and a hand" do
      expect(player.name).to eq("Ken")
      expect(player.hand).to be_a(Blackjack::Hand)
    end
  end

  describe '#human?' do
    it "has a name, a hand, and boolean a value for human" do
      expect(player.human?).to eq(true)
      expect(dealer.human?).to eq(false)
    end
  end

  describe '#stand?' do
    it "returns false by default" do
      expect(player.stand?).to eq(false)
    end
    it "returns true if stand is reset to true" do
      player.stand!
      expect(player.stand?).to eq(true)
    end
  end

  describe '#stand!' do
    it "changes the value of the stand instance variable and returns a string" do
      expect(player.stand?).to eq(false)
      expect(player.stand!).to eq("Ken stands!\n\n")
      expect(player.stand?).to eq(true)
    end
  end

  describe '#wants_to_hit?' do
    it "returns true if hand has value under 17" do
      player.hand.cards << king << five << ace
      expect(player.wants_to_hit?).to eq(true)
    end
    it "returns false if hand has value over 16" do
      player.hand.cards << king << five << ace << ace
      expect(player.wants_to_hit?).to eq(false)
    end
  end

  describe '#score' do
    it "returns the hand's score" do
      player.hand.cards << king << five << ace << ace
      expect(player.score).to eq(17)
    end
  end

  describe '#formatted_score' do
    it "returns the hand's score" do
      player.hand.cards << king << five << ace << ace
      expect(player.formatted_score).to eq("Ken's score: 17\n\n")
    end
  end

  describe '#wins!' do
    it "returns the hand's score" do
      expect(player.wins!).to eq("Ken wins!")
    end
  end

end
