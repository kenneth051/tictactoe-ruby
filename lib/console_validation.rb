module Tictactoe
  class ConsoleValidation
    def initialize(validate, messages)
      @validate = validate
      @messages = messages
    end

    def check_position_range(input)
      return true if @validate.check_position_range(input)
      @messages.out_of_range_message
    end

    def check_input_symbol(input)
      return true if @validate.check_input_symbol(input)
      @messages.invalid_input_message
    end

    def check_board_position(position, board)
      return true if @validate.check_board_position(position, board)
      @messages.position_taken_message
    end
  end
end
