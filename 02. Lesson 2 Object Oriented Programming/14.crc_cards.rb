# Using this file for Rock Paper Scissors Bonus Features

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
    @human_moves << human
    @computer_moves << computer
  end

  def add_winner!(name)
    @winner << name
  end

  def show_history(len1, len2)
    turns.length.times do |idx|
      puts "turns[idx].center(5) #{human_moves[idx].center(len1 + 12)}"\
      "#{computer_moves[idx].ljust(10)}#{winner[idx].rjust(len2 + 2)}"
    end
  end

  def turns
    @turns.map(&:to_s)
  end
end

class Player
  attr_accessor :move, :name, :score

  def set_score
    @score = 0
  end
end

class Human < Player
  def set_name
    name = ''
    loop do
      puts "What's your name?"
      answer = gets.chomp.strip
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    self.namme = name.capitalize
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
  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    p "Human chooses #{human.choose}"
    p "Computer chosses #{computer.choose}"
    why?
  end

  def human_won?
    human.move > computer.move
  end

  def computer_won?
    computer.move > human.move
  end

  def why?
    if human_won?
      print "Human won because "
      human.move.defeated(computer.move)
    elsif computer_won?
      print "Computer won becuase "
      computer.move.defeated(human.move)
    else
      puts "Its a tie!"
    end
  end
end

RPSGame.new.play
