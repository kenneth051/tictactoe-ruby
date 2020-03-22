module Tictactoe
  class Validation
    def initialize(messages, io)
      @io = io
      @messages = messages
    end

    def check_input_symbol(input)
      if ["x", "o"].include? input
        return input
      end
      @messages.invalid_input_message
    end

    def check_position_range(input)
      if input > 0 && input <= 9
        return input
      end
      @messages.out_of_range_message
    end

    def check_board_position(input, board)
      if board[input - 1] == "-"
        return input
      end
      @messages.position_taken_message
    end

  end
end
