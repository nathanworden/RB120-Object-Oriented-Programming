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
    copy_hand = cards.dup
    convert_all_to_integers_except_aces!(copy_hand)
    if copy_hand.map(&:to_s).any? { |word| word.start_with?("Ace") }
      copy_hand_total_w_o_aces = copy_hand.map(&:to_i).sum
      copy_hand_total_w_o_aces += if copy_hand_total_w_o_aces + 11 > 21
                                    1
                                  else
                                    11
                                  end
      @total = copy_hand_total_w_o_aces
    else
      @total = copy_hand.map(&:to_i).sum
    end
  end

  def convert_all_to_integers_except_aces!(hand)
    hand.map! do |card|
      if card.start_with?(/[JQK]/)
        10
      elsif card.start_with?(/\d/)
        card.to_i
      else
        card
      end
    end
  end
end

class Player
  include Hand
end

class Deck
  attr_accessor :current_deck

  def initialize
    suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
    card_values = ["2", "3", "4", "5", "6", "7", "8", "9", "10"] +
                  ["Jack", "Queen", "King", "Ace"]
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
    # what are the "states" of a card?
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
      card = deck.current_deck.sample
      player.cards << card
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
    @answer = nil
    loop do
      human.calculate_total
      player_answer_loop
      if @answer == 'h'
        human.hit(deck)
        human.calculate_total
      elsif @answer == 's'
        human.calculate_total
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
    if someone_busted?
      determine_who_busted
    elsif human.total == dealer.total
      puts "It's a tie!"
    elsif human.total > dealer.total
      puts "Human won!"
    elsif dealer.total > human.total
      puts "Dealer won!"
    end
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

  # def declare_winner
  #   if human.busted? && !dealer.busted?
  #     puts "Dealer Won!"
  #   elsif dealer.busted? && !human.busted?
  #     puts "Human won!"
  #   elsif human.busted? && dealer.busted?
  #     puts "You both busted. Its a tie."
  #   elsif human.total > dealer.total
  #     puts "Human won!"
  #   elsif dealer.total > human.total
  #     puts "Dealer won!"
  #   elsif human.total == dealer.total
  #     puts "Its a tie!"
  #   end
  # end
end

Game.new.start
