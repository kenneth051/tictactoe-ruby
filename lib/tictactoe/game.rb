require "./lib/tictactoe/board"
require "./lib/tictactoe/validation"

module Tictactoe
  class Game
    attr_reader :board

    def initialize(validation, messages, io)
      @validation = validation
      @messages = messages
      @io = io
      @io.output(@messages.get_message("welcome"))
      @io.output(@messages.get_message("symbols"))
      @symbols = []
      @board = Board.new
      @game = true
    end

    def draw
      @board.draw
    end

    def get_symbol()
      @io.output(@messages.get_message("enter_symbol"))
      while true
        symbol = @io.input
        if @validation.check_input_symbol(symbol)
          return symbol
        end
      end
    end

    def get_position()
      @io.output(@messages.get_message("enter_position"))
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
        @io.output(@messages.get_message("double_play"))
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

    def output_wining_message(symbol)
      @io.output(@messages.get_message("player_wins", symbol))
    end

    def play_again_input
      @io.output(@messages.get_message("play_again"))
      input = @io.input
      if input == "1"
        @game = true
      end
    end

    def play_again()
      while @game
        play
      end
    end

    def play()
      draw()
      while @board.is_not_full && !check_winner()
        symbol = get_symbol()
        position = get_position()
        make_move(position, symbol)
        draw()
      end
      @game = false
      symbol = check_winner()
      if symbol && symbol[0] == true
        output_wining_message(symbol[1])
      end
      if !@board.is_not_full
        @io.output(@messages.get_message("draw"))
      end
      @board.clear_board
      @symbols = []
      play_again_input
    end
  end
end
