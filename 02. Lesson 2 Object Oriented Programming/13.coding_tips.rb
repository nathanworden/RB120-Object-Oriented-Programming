
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



# Different puts outputs depending on message type
module Display
  SCREEN_WIDTH = 80

  def self.puts_cmd(msg)
    msg_arr = line_break_msg(msg, 4)
    msg_arr.each {|line| puts ">>> #{line}"}