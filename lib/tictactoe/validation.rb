module Tictactoe
  class Validation
    def check_input_symbol(input)
      if ["x", "o"].include? input
        return input
      end
      puts "invalid input, symbol be either 'x' or 'o' lowercase"
    end

    def check_position_range(input)
      if input > 0 && input <= 9
        return input
      end
      puts "position out of range, enter from 1 to 9"
    end

    def check_board_position(input, board)
      if board[input - 1] == "-"
        return input
      end
      puts "position has been taken, choose another one"
    end
  end
end
