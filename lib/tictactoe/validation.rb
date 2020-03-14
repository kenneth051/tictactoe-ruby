module Tictactoe
  class Validation
    def initialize(messages,io)
      @io =io
      @messages = messages
    end

    def check_input_symbol(input)
      if ["x", "o"].include? input
        return input
      end
      @io.output(@messages.get_message("invalid_input"))
    end

    def check_position_range(input)
      if input > 0 && input <= 9
        return input
      end
      @io.output(@messages.get_message("out_of_range"))
    end

    def check_board_position(input, board)
      if board[input - 1] == "-"
        return input
      end
      @io.output(@messages.get_message("position_taken"))
    end
  end
end
