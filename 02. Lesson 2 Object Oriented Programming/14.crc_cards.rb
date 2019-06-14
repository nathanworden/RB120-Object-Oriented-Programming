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
    @human_moves << human          # in the example problem this is human.value
    @computer_moves << computer    # in the example problem this is computer.value
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

  def initialize
    puts "A player has been created"
  end

  def set_score
    @score = 0
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, Spock:"
      choice = gets.chomp.downcase
      break if ['rock', 'paper', 'scissors', 'lizard', 'spock'].include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = choice
  end
end

class Computer < Player
  def choose
    self.move = ['rock', 'paper', 'scissors', 'lizard', 'spock'].sample
  end
end

class RPSGame
  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  WINNING_PIECES = {'rock' => ['scissors', 'lizard'],
                    'paper' => ['rock', 'spock'],
                    'scissors' => ['paper', 'lizard'],
                    'lizard' => ['paper', 'spock'],
                    'spock' => ['scissors', 'rock'] }

  def play
    history = History.new
    p "Human chooses #{human.choose}"
    p "Computer chosses #{computer.choose}"
    p WINNING_PIECES[human.move].include?(computer.move)
 end
end


RPSGame.new.play











