module Tictactoe
  class Validation
    def check_input_symbol(input)
      if ["x", "o"].include? input
        return input
      else
        puts "invalid input, symbol be either 'x' or 'o' lowercase"
      end
    end

    def check_input_position(input)
      if input <= 0 || input > 9
        puts "position out of range, enter from 1 to 9"
      else
        return input
      end
    end

    def check_board_position(input, board)
      if board[input - 1] != "-"
        puts "position has been taken, choose another one"
      else return input       end
    end
  end
end
