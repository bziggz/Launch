class Card
  include Comparable
  attr_reader :rank, :suit, :numeric_rank
  NUMERIC_RANKS = {
    1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5,
    6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10,
    "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14
  }

  def initialize(rank, suit)
    @rank = rank
    @numeric_rank = NUMERIC_RANKS[rank]
    @suit = suit
  end

  def <=>(other)
    numeric_rank <=> other.numeric_rank
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def reset
    @deck = RANKS.product(SUITS)
  end

  def draw
    reset if @deck.empty?
    card = @deck.sample
    @deck.delete(card)
    Card.new(card[0], card[1])
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.