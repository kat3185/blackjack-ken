require "spec_helper"

RSpec.describe Blackjack::Game do
  class Blackjack::Game
    public :announce_winner
  end
  let(:game) { Blackjack::Game.new(name: "Ken") }

  describe '#initialize' do
    it "has two players, an computer, and a pre-set input" do
      expect(game.player.name).to eq("Ken")
      expect(game.player).to be_a(Blackjack::Player)
      expect(game.computer).to be_a(Blackjack::Player)
      expect(game.computer.name).to eq("Dealer")
      expect(game.deck).to be_a(Blackjack::Deck)
      expect(game.input).to eq(" ")
    end
  end

  describe '#announce_winner' do
    it "returns a string announcing the winner" do
      expect(game.announce_winner).to eq("It's a tie! |-o-|\n" + game.computer.wins!)
    end
  end
end
