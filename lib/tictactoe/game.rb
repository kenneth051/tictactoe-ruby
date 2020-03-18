require "./lib/tictactoe/board"
require "./lib/tictactoe/validation"

module Tictactoe
  class Game
    attr_accessor :board, :symbols, :game_in_session

    def initialize(validation, messages, io, board = Board.new)
      @validation = validation
      @messages = messages
      @io = io
      @messages.welcome_message
      @messages.symbols_message
      @symbols = []
      @board = board
      @game_in_session = true
    end

    def draw
      @board.draw
    end

    def get_symbol()
      @messages.enter_symbol_message
      while true
        symbol = @io.input
        if @validation.check_input_symbol(symbol)
          return symbol
        end
      end
    end

    def get_position()
      @messages.enter_position_message
      while true
        position = @io.input.to_i
        if @validation.check_position_range(position) &&
           @validation.check_board_position(position, @board.positions)
          return position
        end
      end
    end

    def make_move(move, symbol)
      while @symbols[-1] == symbol
        @messages.double_play_message
        return
      end
      @symbols.push(symbol)
      position = move - 1
      @board.positions[position] = symbol
    end

    def winning_combinations(symbol)
      combinations = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
      ]
      combinations.any? do |combination|
        combination.all? { |position| @board.positions[position] == symbol }
      end
    end

    def check_winner()
      players = ["o", "x"]
      players.each do |symbol|
        if winning_combinations(symbol)
          return true, symbol
        end
      end
      return false
    end

    def output_winning_message(symbol)
      @messages.winning_message(symbol)
    end

    def play_again_input
      @messages.play_again_message
      input = @io.input
      if input == "1"
        @game_in_session = true
      end
    end

    def end?
      !@board.is_full && !check_winner()
    end

    def draw?
      if @board.is_full
        @messages.draw_message
      end
    end

    def win?
      if symbol = check_winner()
        output_winning_message(symbol[1])
      end
    end

    def play_again
      while @game_in_session
        play
      end
    end

    def prepare_new_game
      @board.clear_board
      @symbols = []
    end

    def play
      draw()
      while end?
        symbol = get_symbol
        position = get_position
        make_move(position, symbol)
        draw()
      end
      @game_in_session = false
      win?
      draw?
      prepare_new_game
      play_again_input
    end
  end
end
