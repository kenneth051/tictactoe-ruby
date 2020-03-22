require "./lib/tictactoe/board"
require "./lib/tictactoe/validation"

module Tictactoe
  class Game
    attr_accessor :board, :symbols

    def initialize(validation, messages, io, board = Board.new)
      @validation = validation
      @messages = messages
      @io = io
      @symbols = []
      @board = board
      @game_in_session = true
    end

    def draw
      @board.draw
    end

    def get_symbol(input)
      symbol = input
      if @validation.check_input_symbol(symbol)
        return symbol
      end
    end

    def get_position(input)
      position = input
      if @validation.check_position_range(position) &&
         @validation.check_board_position(position, @board.positions)
        return position
      end
    end

    def make_move(symbol, move)
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

    def prepare_new_game
      @board.clear_board
      @symbols = []
    end

    def game_status(win = nil,
                    draw = nil,
                    prepare_new_game = nil,
                    play_again_input = nil)
      win
      draw
      prepare_new_game
      play_again_input
    end
  end
end
