# Assignment: OO Tic Tac Toe

# Write a description of the problem and extract major nouns and verbs.
# Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.
# Optional - when you have a better idea of the problem, model your thoughts into CRC cards.

# 1) Tic tac toe is a 2 player board game played on a 3x3 grid. Players take turns
# marking a square. The first player to mark 3 squares in a row wins.

#2) Nouns: player, grid, square
# Verbs: play, mark, (what about mark?)

# Let's now organize it a bit:
# Board
# Square
# Player
# 	 - mark
#  	 - play

class Board
	def initialize
	# we need some way to model the 3x3 grid. Maybe "squares"?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
	end
end

class Square
	def initialize
		# maybe a "status" to keep track of this square's mark?
	end
end

class Player
	def initialize
		# maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
	end

	def mark

	end

	def play

	end
end

class TTTGame
	def play
		display_welcome_message
		loop do
			display_board
			first_player_moves
			break if someone_won? || board_full?

			second_player_moves
			break if someone_won? || board_full?
		end
		display_result
		display_goodbye_message
	end
end

# we'll kick off the game like this
game = TTTGame.new
game.play


