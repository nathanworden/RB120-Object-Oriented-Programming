# Rock, paper, scissors, lizard, spock
# Jemima Kingsley
# 2019-06
#
# Features:
#  - keep score and play a 'series' until a winning score is reached
#  - show moves and winning history
#  - 'hackable':
#     If the user chooses moves in 'sync' with the round numbers, the moves win
#     e.g. round 1: rock
#          round 2: paper
#          round 3: scissors
#          etc.
#     If the user gets out of sync, the 'hack' stops working.
#     e.g. round 4: rock  <- out of sequence so halts winning streak
#          round 5: spock <- in sequence but won't guarantee win

require 'pry'

# Different puts outputs depending on message type
module Display
  SCREEN_WIDTH = 80

  def self.puts_cmd(msg)
    msg_arr = line_break_msg(msg, 4)
    msg_arr.each { |line| puts ">>> #{line}" }
  end

  def self.puts_info(msg)
    msg_arr = line_break_msg(msg, 3)
    msg_arr.each { |line| puts ":: #{line}" }
  end

  def self.puts_sub_info(msg)
    msg_arr = line_break_msg(msg, 5)
    msg_arr.each { |line| puts "::   #{line}" }
  end

  def self.puts_spacer
    puts '::'
  end

  def self.puts_heading(msg)
    puts " #{msg} ".center(SCREEN_WIDTH, '=')
  end

  def self.puts_subheading(msg)
    puts " #{msg} ".center(SCREEN_WIDTH)
  end

  def self.clear_screen
    system('clear') || system('cls')
  end

  private_class_method def self.line_break_msg(msg, padding = 0)
    msg_arr = []
    str = ''
    msg.split.each do |word|
      if (str.length + 1 + word.length) > (SCREEN_WIDTH - padding)
        msg_arr << str
        str = word + ' '
      else
        str += word + ' '
      end
    end
    msg_arr << str
  end
end

# Player superclass
class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
    @moves = []
    @winning_moves = {}
  end

  def move_history
    moves.map.with_index do |m, idx|
      @winning_moves.key?(idx + 1) ? "*#{m}" : m
    end.join(', ')
  end

  def moves
    @moves.map(&:to_s)
  end

  def track_winning_move
    @winning_moves[@moves.size] = move
    self.score += 1
  end

  private

  def remember_move(choice)
    self.move = Move.new(choice)
    @moves << move
  end
end

# Human subclass
class Human < Player
  def set_name
    n = nil
    loop do
      Display.puts_cmd "What's your name?"
      n = gets.chomp.strip
      break unless n.empty?

      Display.puts_cmd 'Sorry, must enter a name'
    end
    self.name = n.length > 20 ? "#{n[0..20]}..." : n
  end

  def choose
    choice = nil
    loop do
      Display.puts_cmd "Choose one of: #{Move.valid_moves}"
      choice = gets.chomp.downcase
      return false if RPSGame::QUIT_COMMANDS.include?(choice)

      break if Move.valid?(choice)

      Display.puts_cmd 'Sorry, invalid choice'
    end

    remember_move(choice)
  end
end

# Computer subclass
class Computer < Player
  def choose
    choice = Move.random
    remember_move(choice)
  end

  def choose_to_lose(other_move)
    choice = Move.lose_to(other_move)
    remember_move(choice)
  end

  private

  def set_name
    self.name = %w(R2D2 Hal K9 Deep\ Thought J.A.R.V.I.S.).sample
  end
end

# Move logic
class Move
  attr_reader :value

  VALUES      = { 'r' => 'rock',
                  'p' => 'paper',
                  's' => 'scissors',
                  'l' => 'lizard',
                  'sp' => 'spock' }.freeze
  SUPERIORITY = { rock: %w(scissors lizard),
                  paper: %w(rock spock),
                  scissors: %w(lizard paper),
                  lizard: %w(spock paper),
                  spock: %w(rock scissors) }.freeze

  def initialize(value)
    @value = standardize(value)
  end

  def >(other)
    SUPERIORITY[@value.to_sym].include? other.value
  end

  def <(other)
    SUPERIORITY[other.value.to_sym].include? @value
  end

  def to_s
    @value
  end

  def self.valid?(move)
    VALUES.key?(move) || VALUES.value?(move)
  end

  def self.random
    VALUES.values.sample
  end

  def self.lose_to(other)
    SUPERIORITY[other.to_s.to_sym].sample
  end

  binding.pry
  def self.valid_moves
    VALUES.map do |abr, long|
      "#{long} (#{abr})"
    end.join(', ')
  end

  private

  def standardize(move)
    VALUES.key?(move) ? VALUES[move] : move
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :winner

  GAME_NAME     = 'rock, paper, scissors, spock, lizard'.freeze
  WINNING_SCORE = 6
  QUIT_COMMANDS = %w(q n).freeze

  def initialize
    Display.clear_screen
    @human = Human.new
    @computer = Computer.new
    @winner = nil
    @round = 1
  end

  def play
    display_welcome_message
    loop do
      break unless players_choose

      Display.clear_screen
      determine_winner
      display_outcome
      break if overall_winner?

      @round += 1
    end
    display_goodbye_message
  end

  private

  def players_choose
    return false unless human.choose

    human_hacking? ? computer.choose_to_lose(human.move) : computer.choose
  end

  def human_hacking?
    num_moves = human.moves.size
    move_order = Move::VALUES.values
    move_order_expanded = move_order * ((num_moves / move_order.size) + 1)
    human.moves == move_order_expanded[0, num_moves]
  end

  def human_winner?
    human.move > computer.move
  end

  def computer_winner?
    computer.move > human.move
  end

  def determine_winner
    self.winner = nil
    self.winner = if human_winner?
                    human
                  elsif computer_winner?
                    computer
                  end

    winner&.track_winning_move # &. safe navigation, so only returns if not nil
    winner
  end

  def overall_winner?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def longest_name_size
    [human.name.size, computer.name.size].max
  end

  def display_welcome_message
    Display.puts_info "Hi, #{human.name}, welcome to #{GAME_NAME}!"
  end

  def display_goodbye_message
    Display.puts_info "Thanks for playing #{GAME_NAME}!"
  end

  def display_outcome
    display_round
    display_moves
    display_winner
    Display.puts_spacer
    display_score_and_moves
    display_overall_winner
    Display.puts_spacer
  end

  def display_round
    Display.puts_heading "Round #{@round}"
    Display.puts_subheading "(#{QUIT_COMMANDS.join(' or ')} to quit)"
  end

  def display_moves
    [human, computer].each do |player|
      p_padded = "#{player.name} chose".ljust(longest_name_size + 6, '.')
      Display.puts_info "#{p_padded}: #{player.move}"
    end
  end

  def display_winner
    Display.puts_info winner ? "#{winner.name} won!" : "It's a tie"
  end

  def display_score_and_moves
    Display.puts_info 'Score and moves (* indicates win):'
    [human, computer].each do |player|
      p_padded = player.name.ljust(longest_name_size, '.')
      Display.puts_sub_info "#{p_padded}: " \
                            "#{player.score} (#{player.move_history})"
    end
    Display.puts_info "First player to #{WINNING_SCORE} wins the series!"
  end

  def display_overall_winner
    return unless overall_winner?

    Display.puts_spacer
    Display.puts_info "#{winner.name} wins the series!"
  end
end

RPSGame.new.play