require_relative "./game"

module Tictactoe
  class ConsoleGame
    attr_accessor :game_in_session

    def initialize(game, messages, io, validation)
      @game = game
      @messages = messages
      @validation = validation
      @io = io
      @messages.welcome_message
      @messages.symbols_message
      @game_in_session = true
    end

    def validate_position(input)
      position = input
      if @validation.check_position_range(position) &&
         @validation.check_board_position(position, @game.board.positions)
        return position
      end
    end

    def validate_symbol(input)
      symbol = input
      if @validation.check_input_symbol(symbol)
        return symbol
      end
    end

    def get_position()
      @messages.enter_position_message
      while true
        input = @io.input.to_i
        position = validate_position(input)
        return position if position
      end
    end

    def get_symbol()
      @messages.enter_symbol_message
      while true
        input = @io.input
        symbol = validate_symbol(input)
        return symbol if symbol
      end
    end

    def make_move(symbol, move)
      while @game.symbols[-1] == symbol
        @messages.double_play_message
        return
      end
      @game.symbols.push(symbol)
      @game.make_move(symbol, move)
    end

    def play
      @game.draw()
      while !@game.end?
        make_move(get_symbol, get_position)
        @game.draw()
      end
      @game_in_session = false
      @game.game_status(@game.win?, @game.draw?, @game.prepare_new_game, play_again_input)
    end

    def play_again_input
      @messages.play_again_message
      input = @io.input
      if input == "1"
        @game_in_session = true
      end
    end

    def play_again
      while @game_in_session
        play
      end
    end
  end
end
