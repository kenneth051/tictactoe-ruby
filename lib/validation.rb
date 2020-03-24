module Tictactoe
  class Validation

    def check_input_symbol(input)
      if ["x", "o"].include? input
        return true
      end
    end

    def check_position_range(input)
      if input > 0 && input <= 9
        return true
      end
    end

    def check_board_position(input, board)
      if board[input - 1] == "-"
        return true
      end
    end



  end
end
