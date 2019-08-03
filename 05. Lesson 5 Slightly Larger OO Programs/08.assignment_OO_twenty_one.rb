# 1) Write a Description of the problem
# Twenty One is a card game where the goal of the game is to get your
# cards to add up to exactly 21. The game is dealer vs. player. 
 # - Both players are delt 2 cards from a 52 card deck.
 # - The player takes the first turn, and can 'hit' or 'stay'
 # - If the player busts, he loses. If he stays, its the dealer's turn
 # - The dealer must hit until his cards add up to at least 17
 # - If he busts, the player wins. If both player and dealer stays, then the highest total wins.
 # - If both totals are equal, then it's a tie, and nobody wins.

 #2) Nouns and verbs:
 # Nouns: card, deck, player, dealer, participant, game, total
 # Verbs: deal, Hit, sty, bust

 #3) 
# Player
  # - hit
  # - stay
  # - busted?
  # - total
# Dealer
  # - hit
  # - stay
  # - busted?
  # - total
  # - deal (should this be here, or in Deck?)
# Participant
# Deck
# - deal (should this be here, or in Dealer?)
# Card
# Game
# - start

#4)
module Hand
  def initialize(cards, name)
    @cards = cards
    @name = name
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
    #definitley looks like we need to know about "cards" to produce some total.
  end
end

class Player
  include Hand
end

class Dealer
  include Hand
end


class Deck
  attr_reader :deck

  def initialize
    suits = ["Hearts", "Spades", "Clubs", "Diamods"]
    card_values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    @deck = []
    suits.each do |suit|
      card_values.each do |card|
        @deck << card + " of " + suit
      end
    end
  end

  def deal
    # does the dealer or the deck deal?
  end
end

class Card
  def initialize
    #what are the "states" of a card?
  end
end

class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start








