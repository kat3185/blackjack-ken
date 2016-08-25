require "spec_helper"
require 'stringio'

RSpec.describe Blackjack::Turn do
  class Blackjack::Turn
    public :over?, :deal_to_player, :hit_or_stand, :player_hits!, :get_input

    def get_action
      $stdin.gets.chomp
    end
  end

  let(:hand) { Blackjack::Hand.new }
  let(:deck) { Blackjack::Deck.new }
  let(:player) { Blackjack::Player.new(name: "Ken", hand: hand, human: true) }
  let(:dealer) { Blackjack::Player.new(name: "Dealer", hand: hand) }
  let(:turn) { Blackjack::Turn.new(player: player, deck: deck) }
  let(:dealer_turn) { Blackjack::Turn.new(player: dealer, deck: deck) }

  describe '#initialize' do
    it "has a player, deck and input" do
      expect(turn.player).to be_a(Blackjack::Player)
      expect(turn.deck).to be_a(Blackjack::Deck)
      expect(turn.input).to eq(nil)
    end
  end

  describe '#get_input' do
    it "should accept valid input" do
      Blackjack::Turn::VALID_OPTIONS.each do |option|
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
