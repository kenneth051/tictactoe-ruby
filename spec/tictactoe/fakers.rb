class FakeValidation
    def check_input_symbol(input)
      return input
    end
  
    def check_input_position(input)
      return input
    end
  
    def check_board_position(input, board)
      return input
    end
  end
  
  class FakeStringInput
    def initialize(input = [])
      @input = input
    end
  
    def gets
      return @input.shift()
    end
  end