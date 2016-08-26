class Blackjack
  class Card
    attr_reader :rank, :suit
    def initialize(args)
      @rank = args[:rank]
      @suit = args[:suit]
    end

    def display
      rank.to_s + suit
    end

    def value
      case
      when is_facecard?
        10
      when is_ace?
        1
      else
        rank
      end
    end

    def is_ace?
      rank == 'A'
    end

    private
    def is_facecard?
      'JQK'.include?(rank.to_s)
    end
  end
end
