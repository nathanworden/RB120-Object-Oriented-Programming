require 'pry'
module Hand
  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def hit(deck)
    cards << deck.all_cards.delete(deck.all_cards.sample)
  end

  def busted?
    total > 21
  end

  def total
    total = 0
    cards.each do |card|
      total += if card.ace?
                 11
               elsif card.jack? || card.queen? || card.king?
                 10
               else
                 card.value.to_i
               end
    end

    # correct for Aces
    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end

    total
  end
end

class Player
  include Hand

  def initialize(name)
    super(name)
    initialize_name(name)
  end

  def initialize_name(name)
    if name == "Human"
      system 'clear'
      loop do
        puts "What's your name?"
        self.name = gets.chomp
        break unless name.empty?
        puts "Sorry, must enter a value."
      end
    else
      self.name = ['Blarg', "Bohemian", "Romancer", "Charlie Bit Me"].sample
    end
  end
end

class Deck
  attr_accessor :all_cards

  def initialize
    @all_cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @all_cards << Card.new(suit, value)
      end
    end
  end
end

class Card
  SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10"] +
           ["Jack", "Queen", "King", "Ace"]

  attr_accessor :value, :suit

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "The #{value} of #{suit}"
  end

  def ace?
    value == 'Ace'
  end

  def king?
    value == 'King'
  end

  def queen?
    value == 'Queen'
  end

  def jack?
    value == 'Jack'
  end
end

class Game
  attr_accessor :deck
  attr_reader :human, :dealer

  def initialize
    @human = Player.new("Human")
    @dealer = Player.new("Dealer")
    @deck = Deck.new
  end

  def start
    system 'clear'
    display_welcome_message
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end

  def display_welcome_message
    puts "Welcome to 21!"
    puts ""
  end

  def deal_cards
    deal_to(@human)
    deal_to(@dealer)
  end

  def deal_to(player)
    2.times do
      card = deck.all_cards.sample
      player.cards << card
      deck.all_cards.delete(card)
    end
  end

  def show_initial_cards
    show_human_cards(true)
    p "#{dealer.name} is showing: #{dealer.cards[0]}"
  end

  def show_human_cards(clear=false)
    system 'clear' unless clear
    puts "#{human.name}'s Cards"
    human_cards_line
    human.cards.each do |card|
      card_line(card, human)
    end
    human_cards_line
  end

  def human_cards_line
    puts "+---" + "-" * length_of_longest_card_string(human) + "----+"
  end

  def player_turn
    @answer = nil
    loop do
      human.total
      player_answer_loop
      if @answer == 'h'
        human.hit(deck)
        human.total
      elsif @answer == 's'
        human.total
        break
      end
      show_human_cards
      break if human.busted?
    end
  end

  def player_answer_loop
    loop do
      puts "Would you like to hit ('h') or stay ('s')?"
      @answer = gets.chomp.downcase
      break if @answer == 'h' || @answer == 's'
      puts "Invalid entry. Must enter 'h' or 's'"
    end
  end

  def dealer_turn
    dealer.total
    loop do
      dealer.hit(deck) if dealer.total < 17
      dealer.total
      break if dealer.busted? || dealer.total >= 17
    end
  end

  def show_result
    human_result_info
    dealer_result_info
    show_dealer_final_cards
    declare_winner
  end

  def human_result_info
    puts "#{human.name}'s total is #{human.total}"
    puts "#{human.name} Busted" if human.busted?
  end

  def dealer_result_info
    puts "#{dealer.name}'s total is #{dealer.total}"
    puts "#{dealer.name} Busted" if dealer.busted?
  end

  def show_dealer_final_cards
    puts "Dealer's final cards are:"
    puts "+---" + "-" * length_of_longest_card_string(dealer) + "----+"
    dealer.cards.each do |card|
      card_line(card, dealer)
    end
    puts "+---" + "-" * length_of_longest_card_string(dealer) + "----+"
  end

  def card_line(card, player)
    puts "|  => The #{card.value} of #{card.suit}" +
         " " * (length_of_longest_card_string(player) - card_suit_size(card)) +
         "  |"
  end

  def length_of_longest_card_string(player)
    player.cards.map do |card|
      card_suit_size(card)
    end.max
  end

  def card_suit_size(card)
    "The #{card.value} of #{card.suit}".size
  end

  def declare_winner
    if someone_busted?
      determine_who_busted
    elsif tie?
    elsif human_won?
    elsif dealer_won?
    end
  end

  def dealer_won?
    puts "#{dealer.name} won!" if dealer.total > human.total
  end

  def human_won?
    puts "#{human.name} won!" if human.total > dealer.total
  end

  def tie?
    puts "It's a tie!" if human.total == dealer.total
  end

  def determine_who_busted
    if human.busted? && dealer.busted?
      puts "You both busted. Its a tie."
    elsif human.busted?
      puts "Dealer Won!"
    elsif dealer.busted?
      puts "Human Won!"
    end
  end

  def someone_busted?
    human.busted? || dealer.busted?
  end

  def situations_where_dealer_won
    human.busted? && !dealer.busted? ||
      dealer.total > human.total
  end

  def situations_where_human_won
    dealer.busted? && !human.busted? ||
      human.total > dealer.total
  end
end

Game.new.start
