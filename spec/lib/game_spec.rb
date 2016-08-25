require "spec_helper"

RSpec.describe Game do
  let(:game) { Game.new("Ken") }

  describe '#initialize' do
    it "has two players, an computer, and a pre-set input" do
      expect(game.player.name).to eq("Ken")
      expect(game.player).to be_a(Player)
      expect(game.computer).to be_a(Player)
      expect(game.computer.name).to eq("Dealer")
      expect(game.deck).to be_a(Deck)
      expect(game.input).to eq(" ")
    end
  end
end
