require "spec_helper"
require 'stringio'

RSpec.describe Turn do
  class Turn
    public :over?, :deal_to_player, :hit_or_stand, :player_hits, :get_input

    def get_action
      $stdin.gets.chomp
    end
  end

  let(:hand) { Hand.new }
  let(:deck) { Deck.new }
  let(:player) { Player.new(name: "Ken", hand: hand, human: true) }
  let(:dealer) { Player.new(name: "Dealer", hand: hand) }
  let(:turn) { Turn.new(player: player, deck: deck) }
  let(:dealer_turn) { Turn.new(player: dealer, deck: deck) }

  describe '#initialize' do
    it "has a player, deck and input" do
      expect(turn.player).to be_a(Player)
      expect(turn.deck).to be_a(Deck)
      expect(turn.input).to eq(nil)
    end
  end

  describe '#get_input' do
    it "should accept valid input" do
      Turn::VALID_OPTIONS.each do |option|
        allow($stdin).to receive(:gets).and_return(option)
        turn.get_input
        expect(turn.input).to eq(option)
      end
    end
  end

  describe '#deal_to_player' do
    it "returns a formatted string" do
      card = turn.deck.cards.last
      expect(turn.deal_to_player).to eq("#{turn.player.name} was dealt #{card.display}")
    end
  end
end
