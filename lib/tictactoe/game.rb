require "./lib/tictactoe/board"
require "./lib/tictactoe/validation"

module Tictactoe
  class PositionOutOfRange < StandardError; end

  class Game
    attr_reader :board

    def initialize(validation, stdin: $stdin)
      @validation = validation
      @stdin = stdin
      puts "Welcome to Tic-Tac-Toe"
      puts "Player one uses 'X' and player two uses 'O'"
      @symbols = []
      @board = Board.new
    end

    def draw
      @board.draw
    end

    def get_symbol()
      puts "Enter symbol"
      while true
        symbol = @stdin.gets.chomp
        if !@validation.check_input_symbol(symbol)
        else return symbol         end
      end
    end

    def get_position()
      puts "Enter position"
      while true
        position = @stdin.gets.chomp.to_i
        if !@validation.check_input_position(position)
        elsif !@validation.check_board_position(position, @board.positions)
        else return position         end
      end
    end

    def make_move(move, symbol)
      if @symbols[-1] == symbol
        raise "Error"
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
      while @board.is_not_board_full
        if check_winner() != true
          symbol = get_symbol()
          position = get_position()
          make_move(position, symbol)
          draw()
        else
          return false
        end
      end
      puts " IT'S A DRAW!"
    end
  end
end
