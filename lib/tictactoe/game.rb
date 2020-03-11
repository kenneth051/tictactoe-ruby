require "./lib/tictactoe/board"
require "./lib/tictactoe/validation"

module Tictactoe
  class PositionOutOfRange < StandardError; end

  class Game
    attr_reader :board

    def initialize(validation, messages, stdin: $stdin)
      @validation = validation
      @messages = messages
      @stdin = stdin
      puts @messages.get_message("welcome")
      puts @messages.get_message("symbols")
      @symbols = []
      @board = Board.new
    end

    def draw
      @board.draw
    end

    def get_symbol()
      puts @messages.get_message("enter_symbol")
      while true
        symbol = @stdin.gets.chomp
        if @validation.check_input_symbol(symbol)
          return symbol
        end
      end
    end

    def get_position()
      puts @messages.get_message("enter_position")
      while true
        position = @stdin.gets.chomp.to_i
        if @validation.check_position_range(position) &&
           @validation.check_board_position(position, @board.positions)
          return position
        end
      end
    end

    def make_move(move, symbol)
      while @symbols[-1] == symbol
        puts @messages.get_message("double_play")
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
          puts "Player using '#{symbol}' has won!"
          return true
        end
      end
    end

    def play()
      draw()
      while @board.is_not_full
        if check_winner() != true
          symbol = get_symbol()
          position = get_position()
          make_move(position, symbol)
          draw()
        else
          return false
        end
      end
      puts @messages.get_message("draw")
    end
  end
end
