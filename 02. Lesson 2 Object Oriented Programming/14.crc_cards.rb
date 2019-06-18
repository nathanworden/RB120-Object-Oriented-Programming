# Using this file for Rock Paper Scissors Bonus Features
require 'pry'

class History
  attr_accessor :human_moves, :computer_moves, :winner

  def initialize
    @turns = []
    @human_moves = []
    @computer_moves = []
    @winner = []
  end

  def add_turn!(number)
    @turns << number
  end

  def add_moves!(human, computer)
    @human_moves << human.value
    @computer_moves << computer.value
  end

  def add_winner!(name)
    @winner << name
  end

  def show_history(len1, len2)
    turns.length.times do |idx|
      puts "#{turns[idx].center(5)}#{human_moves[idx].center(len1 + 12)}"\
      "#{computer_moves[idx].ljust(10)}#{winner[idx].rjust(len2 + 2)}"
    end
  end

  def turns
    @turns.map(&:to_s)
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
  end

  def set_score
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp.strip
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n.capitalize
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, Spock:"
      choice = gets.chomp.downcase
      break if ['rock', 'paper', 'scissors', 'lizard', 'spock'].include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def choose
    self.move = Move.new(Move::WINNING_PIECES.keys.sample)
  end

  def set_name
    self.name = ['R2D2', 'Chappie', 'C3PO'].sample
  end
end

class Move
  attr_reader :value

  def initialize(value)
    @value = value
  end

  WINNING_PIECES = { 'rock' => ['scissors', 'lizard'],
                     'paper' => ['rock', 'spock'],
                     'scissors' => ['paper', 'lizard'],
                     'lizard' => ['paper', 'spock'],
                     'spock' => ['scissors', 'rock'] }

  EXPLINATION = { 'rock' => ['crushes scissors', 'crushes lizard'],
                  'paper' => ['covers rock', 'disproves Spock'],
                  'scissors' => ['cuts paper', 'decapitates lizard'],
                  'lizard' => ['eats paper', 'poisons Spock'],
                  'spock' => ['smashes scissors', 'vaporizes rock'] }

  def >(other_move)
    WINNING_PIECES[value].include?(other_move.value)
  end

  def defeated(other_move)
    index = WINNING_PIECES[value].index(other_move.value)
    puts "#{value} #{EXPLINATION[value][index]}"
  end

  def to_s
    @value
  end
end

class RPSGame
  attr_accessor :human, :computer, :rounds, :history

  def initialize
    clear_screen
    display_welcome_message
    @human = Human.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissros, Lizard, Spock!"
    puts "The player that wins the first 3 games will be the Grand Winner."
  end

  def challengers_introduction
    puts "#{computer.name} is your challenger."
  end

  def play
    clear_screen
    outer_game_loop
  end

  def display_game_history
    len1 = human.name.length
    len2 = human.name.length
    puts "\nRound   #{human.name}   #{computer.name}    Winner"
    puts "------------------------------#{'-' * (len11 * 1.5)}"
    history.show_history(len1, len2)
  end

  def outer_game_loop
    loop do
      @computer = Computer.new
      computer.set_score
      human.set_score
      @rounds = 0
      @history = History.new

      challengers_introduction
      inner_game_loop
      display_score

      display_grand_winner
      break unless play_again?
      clear_screen
    end
  end

  def inner_game_loop
    loop do
      @rounds = 0
      inner_loop_game_methods
      break if grand_winner?
    end
  end

  def inner_loop_game_methods
    history.add_turn!(rounds)
    display_score
    history.add_moves!(human.choose, computer.choose)
    clear_screen
    display_moves
    display_winner
    increment_score!
    why_they_won
    add_winner_in_history
    display_game_history
  end

  def display_grand_winner
    if human.score == 3
      puts "#{human.name} is our Grand Champion!"
    elsif computer.score == 3
      puts "#{computer.name} is our Grand Champion!"
    end
  end

  def increment_score!
    if human_won?
      human.score += 1
    elsif computer_won?
      computer.score += 1
    end
  end

  def add_winner_in_history
    history.add_winner!(if human_won?
                          human.name
                        elsif computer_won?
                          computer.name
                        else
                          'Draw'
                        end)
  end

  def display_moves
    p "#{human.name} chooses #{human.choose}"
    p "#{computer.name} chooses #{computer.choose}"
  end

  def display_score
    puts "\n\n#{' ' * human.name.length}    SCORE"
    puts "#{human.name}: #{human.score}   ||    "\
    "#{computer.name}: #{computer.score}"
    puts ''
  end

  def why_they_won
    if human_won?
      print "#{human.name} won because "
      because(human, computer)
    elsif computer_won?
      print "#{computer.name} won becuase "
      because(computer, human)
    else
      puts "Its a tie!"
    end
  end

  def because(player1, player2)
    player1.move.defeated(player2.move)
  end

  def human_won?
    human.move > computer.move
  end

  def computer_won?
    computer.move > human.move
  end

  def grand_winner?
    human.score == 3 || computer.score == 3
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts 'Sorry, must be y or n.'
    end
  end

  def clear_screen
    system('clear')
  end
end

binding.pry
RPSGame.new.play
