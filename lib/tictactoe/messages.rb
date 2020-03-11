ALL_MESSAGES = {
    "invalid_input" => "invalid input, symbol be either 'x' or 'o' lowercase",
    "out_of_range" => "position out of range, enter from 1 to 9",
    "position_taken" => "position has been taken, choose another one",
    "welcome" => "Welcome to Tic-Tac-Toe",
    "symbols" => "Use 'x' or 'o'",
    "enter_symbol" => "Enter symbol",
    "enter_position" => "Enter position",
    "double_play" => "You cannot play consecutively",
    # "player_wins" => "Player using '%d' has won!" % [symbol],
    "draw" => " IT'S A DRAW!",
  },
module Tictactoe
  class Messages
    def initialize(messages,index)
      @messages = messages
      @index = index
    end

    def get_message(key)
      return @messages[@index][key]
    end
  end
end
