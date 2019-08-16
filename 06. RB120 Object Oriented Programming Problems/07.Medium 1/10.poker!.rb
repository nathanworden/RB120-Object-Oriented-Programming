require 'pry'

class Card
  attr_reader :rank, :suit, :title

  def initialize(rank, suit)
    @rank = rank
    @title = convert(rank)
    @suit = suit
  end

  def convert(rank)
    case rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    else
      rank
    end
  end

  def <=>(other_card)
    title <=> other_card.title
  end

  def <(other_card)
    title < other_card.title
  end

  def <=(other_card)
    title <= other_card.title
  end

  def >=(other_card)
    title >= other_card.title
  end

  def >(other_card)
    title > other_card.title
  end

  def ==(other_card)
    title == other_card.title
  end

  def to_s
    "The #{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.shuffle!
    @deck.pop
  end

  private

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end

class PokerHand
  attr_accessor :deck, :drawn, :suits, :titles

  def initialize(deck)
    @deck = deck
    @drawn = []
    @suits = []
    @titles = []
    draw
    get_suits
    get_titles
  end

  def draw
    5.times {drawn << deck.draw}
  end

  def print
    puts drawn
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  def get_suits
    drawn.each {|card| suits << card.suit}
  end

  def get_titles
    drawn.each {|card| titles << card.title}
  end

  private

  def royal_flush?
    drawn.all? {|card| card.title >= 10} && suits.uniq.size == 1
  end

  def straight_flush?
    suits.uniq.size == 1 && titles.max - titles.min == 4
  end
  def four_of_a_kind?
    return false if !titles.uniq.size == 2
    titles.any? {|title| titles.count(title) == 4}
  end

  def full_house?
    return false if titles.uniq.size != 2
    titles.any? {|title| titles.count(title) == 3}
  end

  def flush?
    suits.uniq.size == 1
  end

  def straight?
    titles.max - titles.min == 4 && titles.uniq.size == 5
  end

  def three_of_a_kind?
    return false if !titles.uniq.size == 3
    titles.any? {|title| titles.count(title) == 3}
  end

  def two_pair?
    titles.select {|card| titles.count(card) == 2}.uniq.size == 2
  end

  def pair?
    titles.select {|card| titles.count(card) == 2}.uniq.size == 1
  end
end




hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

