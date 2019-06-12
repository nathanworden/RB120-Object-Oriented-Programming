# Rock Paper Scissors

# Nouns: player, move, rule
# Verbs: choose, compare

# Player
# - choose
# Move
# Rule

# - compare

class Player
  def initialize

  end

  def choose

  end

end

class Move
  def initialize

  end
end

class Rule
  def initialize

  end
end

def compare(move1, move2)

end


class RPSGame
  attr_accessor :human, :computer
  def initialize
    @human = Player.new
    @computer = Player.new
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winnder
    display_goodbye_message
  end
end




















