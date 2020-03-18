class FakeValidation
  def check_input_symbol(input)
    return input
  end

  def check_position_range(input)
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

class FakeBoard
  def initialize(bool)
    @bool = bool
  end

  def draw
    return true
  end

  def is_full
    return @bool
  end

  def clear_board
    return Array.new(9, "-")
  end
end

class FakeMessages

  def welcome_message
    return true
  end

  def symbols_message
    return true
  end

  def enter_symbol_message
    return true
  end

  def enter_position_message
    return true
  end

  def double_play_message
    return "string"
  end

  def winning_message(symbol)
    return symbol
  end

  def play_again_message
    return true
  end

  def draw_message
    @draw_message = true
    return true
  end

  def draw_message_is_called
    return @draw_message
  end

  def invalid_input_message
    return true
  end

  def out_of_range_message
    return true
  end

  def position_taken_message
    return true
  end
end
