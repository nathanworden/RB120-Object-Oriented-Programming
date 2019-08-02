require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def find(marker_type)
    square = nil
    WINNING_LINES.each do |line|
      if @squares.values_at(*line).map(&:marker).count(marker_type) == 2
        square_arr = @squares.select {|k, v| line.include?(k) && v.marker == Square::INITIAL_MARKER}.keys
        square = square_arr.first if square_arr.size > 0
      end
    end
    square
  end

  def square_five_open?
    return 5 if @squares[5].marker == Square::INITIAL_MARKER
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :score
  attr_reader :marker

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = "CHOOSE"

  attr_accessor :human_marker
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human_marker = pick_your_marker
    @human = Player.new(human_marker)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message

    loop do
      outer_game_loop
      display_champion

      break unless play_again?
      reset_board
      reset_score
      display_play_again_message
    end

    display_goodbye_message
  end

  def inner_game_loop
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
  end

  def outer_game_loop
    loop do
      display_board

      inner_game_loop

      display_result
      break if champion?
      reset_board
    end
  end

  def pick_your_marker
    puts "Pick any key on your keyboard to be your marker"
    human_marker = gets.chomp
  end

  def champion?
    human.score == 3 || computer.score == 3
  end

  def display_champion
    puts "You are our grand champion! Amazing!" if human.score == 3
    puts "Computer is our grand champion! You have failed humanity." if computer.score == 3
  end

  def display_score
    puts "The score is Human: #{human.score}, Computer: #{computer.score}"
    puts "First one to 3 is our grand champion!"
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human_marker
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    display_score
    puts ""
    board.draw
    puts ""
  end

  def joinor(arr, separator=', ', last='or')
    if arr.size == 1
      "#{arr[0]} is your only option"
    elsif arr.size == 2
      arr[0].to_s + " " + last + " " + arr[1].to_s
    else
      arr[0..-2].join(separator) + separator + last + " " + arr[-1].to_s
    end
  end

  def human_moves
    puts "Choose a square. #{joinor(board.unmarked_keys)}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    square = nil

    if board.winning_square
      square = board.winning_square
    elsif board.find_at_risk_square
      square = board.find_at_risk_square
    else board.square_five_open?
      square = board.square_five_open?
    end

    if !square
      square = board.unmarked_keys.sample
    end

    board[square] = computer.marker
  end

  def current_player_moves
    choose_player_to_go_first if @current_marker == "CHOOSE"
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = human_marker
    end
  end

  def choose_player_to_go_first
    answer = nil
    loop do
      puts "Which player should go first? Select 'h' for 'human' and 'c' for 'computer'"
      answer = gets.chomp
      break if answer == 'h' || answer == 'c'
      puts "I'm sorry, you must enter either 'h' or 'c'"
    end
    if answer == 'h' then @current_marker = human_marker; end
    if answer == 'c' then @current_marker = COMPUTER_MARKER; end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      human.score += 1
      puts "You won!"
      sleep(1)
    when computer.marker
      computer.score += 1
      puts "Computer won!"
      sleep(1)
    else
      puts "It's a tie!"
      sleep(1)
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset_board
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play


