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

require 'pry'

#4)
module Hand
  attr_reader :name
  attr_accessor :cards, :total

  def initialize(name)
    @name = name
    @cards = []
  end

  def hit(deck)
    cards << deck.current_deck.delete(deck.current_deck.sample)
  end

  def busted?
    @total > 21
  end

  def calculate_total
    if cards.any? {|word| word.start_with?("Ace")}
      w_o_aces = cards.map(&:to_i).sum
      if w_o_aces + 11 > 21
        w_o_aces += 1 
      else
        w_o_aces += 11
      end
      @total = w_o_aces
    else
      @total = cards.map(&:to_i).sum
    end
  end

#   def calculate_total
#     cards.map!(&:to_s)
#     if bfr_acc_for_aces.include?("Ace")
#       cards.delete('Ace')
#       if cards.sum + 11 > 21
#         cards << 1
#       else
#         cards << 11
#       end
#     end
#       @total = cards.sum
#   end

#   def bfr_acc_for_aces
#     cards.map! do |card|
#       if card.start_with?("Ace")
#         "Ace"
#       elsif card.to_i == 0
#         10
#       else
#         card.to_i
#       end
#     end
#   end
end

class Player
  include Hand
end


class Deck
  attr_accessor :current_deck

  def initialize
    suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
    card_values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    @current_deck = []
    suits.each do |suit|
      card_values.each do |card|
        @current_deck << card + " of " + suit
      end
    end
  end

end

class Card
  def initialize
    #what are the "states" of a card?
  end
end

class Game
  attr_accessor :deck
  attr_reader :human, :dealer

  def initialize 
    @human = Player.new("human")
    @dealer = Player.new("dealer")
    @deck = Deck.new
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end

  def deal_cards
    2.times do
      card = deck.current_deck.sample
      @human.cards << card
      deck.current_deck.delete(card)
    end
    2.times do
      card = deck.current_deck.sample
      @dealer.cards << card
      deck.current_deck.delete(card)
    end
  end

  def show_initial_cards
    show_human_cards
    p "Dealer is showing: #{dealer.cards[0]}"
    # p "Number of cards in the deck: #{deck.current_deck.size}"
  end

  def show_human_cards
    puts "Human's cards are: #{human.cards}"
  end

  def player_turn
    answer = nil
    loop do
    human.calculate_total
      loop do
        puts "Would you like to hit ('h') or stay ('s')?"
        answer = gets.chomp.downcase
        break if answer == 'h' || answer == 's'
        puts "Invalid entry. Must enter 'h' or 's'"
      end
      if answer == 'h'
        human.hit(deck)
      elsif answer == 's'
        human.calculate_total
        break
      end
      show_human_cards
      break if human.busted?
    end
  end

  def dealer_turn
    # binding.pry
    dealer.calculate_total
    loop do
      dealer.hit(deck) if dealer.total < 17
      dealer.calculate_total
      break if dealer.busted? || dealer.total >= 17
    end
  end

  def show_result
    puts "Human's total is #{human.total}"
    puts "Human Busted" if human.busted? 
    puts "Dealer's total is #{dealer.total}"
    puts "Dealer Busted" if dealer.busted? 
    puts "Dealer's final cards are: #{dealer.cards}"
    declare_winner
  end

  def declare_winner
    if human.busted? && !dealer.busted?
      puts "Dealer Won!"
    elsif dealer.busted? && !human.busted?
      puts "Human won!"
    elsif human.busted? && human.busted?
      puts "You both busted. Its a tie."
    elsif human.total > dealer.total
      puts "Human won!"
    elsif dealer.total > human.total
      puts "dealer won!"
    end
  end
end

Game.new.start


