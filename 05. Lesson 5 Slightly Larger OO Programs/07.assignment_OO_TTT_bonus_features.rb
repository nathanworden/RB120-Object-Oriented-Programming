require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + #rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + #cols
                  [[1, 5, 9], [3, 5, 7]]          # diagnols

  def initialize
    @squares = {}
    reset
  end

  # def set_square_at(key, marker)
  #   @squares[key].marker = marker
  # end

  def unmarked_keys
    @squares.select {|_, sq| sq.unmarked?}.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def count_human_marker(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  # def count_human_marker(line)
  #  [@squares[line[0]].marker, @squares[line[1]].marker, @squares[line[2]].marker].count(TTTGame::HUMAN_MARKER)
  # end

  # def count_computer_marker(line)
  #   [@squares[line[0]].marker, @squares[line[1]].marker, @squares[line[2]].marker].count(TTTGame::COMPUTER_MARKER)
  # end

#  returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      if count_human_marker(@squares.values_at(*line)) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(@squares.values_at(*line)) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end

  def reset
    (1..9).to_a.each {|key| @squares[key] = Square.new}
  end

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
end
#   def winning_marker
#     WINNING_LINES.each do |line|
#       if count_human_marker(@squares.select{|k, _| line.include?(k)}.values) == 3
#         return TTTGame::HUMAN_MARKER
#       elsif count_computer_marker(@squares.select{|k, _| line.include?(k)}.values) == 3
#         return TTTGame::COMPUTER_MARKER
#       end
#     end
#     nil
#   end
# end
#   def winning_marker
#     WINNING_LINES.each do |line|
#       if count_human_marker(line) == 3
#         return TTTGame::HUMAN_MARKER
#       elsif count_computer_marker(line) == 3
#         return TTTGame::COMPUTER_MARKER
#       end
#     end
#     nil
#   end
# end

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
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end

end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Your move! Your open options are: #{board.unmarked_keys.join(', ')}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      case
      when square > 0
        puts "That square has already been taken ya dufus."
      else
        puts "I'm sorry but you didn't input a number. I think you hit another random key on your keyboard. That is not the way we play this game. Please try again."
      end
    end
    board[square] = human.marker
  end

  def computer_moves
    computer_choice = board.unmarked_keys.sample
    board[computer_choice] = computer.marker
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
    puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play agina? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    return false if answer == 'n'
    return true if answer == 'y'
  end

  def someone_won?
    false
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def play
    display_welcome_message
    sleep(1)
    clear
    loop do
      display_board

      loop do
        human_moves
        break if board.someone_won? || board.full?
        computer_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board
      end
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end
end

game = TTTGame.new

game.play

