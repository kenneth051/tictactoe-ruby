require "./lib/tictactoe/board"

module Tictactoe
  class PositionOutOfRange < StandardError; end

  class Game
    attr_reader :board

    def initialize
      puts "Welcome to Tic-Tac-Toe"
      puts "Player one uses 'X' and player two uses 'O'"
      @symbols = []
      @board = Board.new
    end

    def draw
      @board.draw
    end

    def position_within_range(position)
      if position < 0 || position > 9
        raise PositionOutOfRange
      end
    end

    def check_position(pos)
      if @board.positions[pos] != "-"
        raise "Error"
      end
      return true
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

    def check_winner(input)
      player = { "x" => "one", "o" => "two" }
      if winning_combinations(input)
        puts "Player #{player[input]} has won!"
        return true
      end
    end

    def play()
      draw()
      # while the board is not full and check_winner is not true
      while @board.is_not_board_full && check_winner("x") != true
        if !check_winner("x") || !check_winner("o")
          puts "Enter symbol"
          symbol = gets.chomp
          puts "Enter position"
          position = gets.chomp.to_i
          position_within_range(position - 1)
          check_position(position - 1)
          make_move(position, symbol)
          draw()
        end
      end
      puts "Game is a tie"
    end
  end
end
