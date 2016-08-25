class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def display
    rank.to_s + suit
  end

  def is_ace?
    rank == 'A'
  end

  def is_facecard?
    'JQK'.include?(rank.to_s)
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
end
