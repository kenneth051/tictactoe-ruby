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

    def get_valid_user_symbol_input
      puts "Enter symbol"
      while true
        symbol= gets.chomp
        if ["x","o"].include? symbol
          return symbol
      else
        puts "invalid input, symbol be either 'x' or 'o' lowercase"
      end
    end
  end
  def check_input_position(input)
    if input <= 0 || input > 9
      puts "position out of range, enter from 1 to 9"
    else 
      return input
    end
  end
  def check_board_position(input)
    if @board.positions[input-1] != "-"
    puts "position has been taken, choose another one"
    else return input
    end
  end

    def get_valid_user_position_input(stdin: $stdin)
      puts "Enter position"
      while true
        position = stdin.gets.chomp.to_i
        if !check_input_position(position)
        elsif !check_board_position(position)
        else return position
        end
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
      players = ["o","x"]
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
          symbol = get_valid_user_symbol_input()
          position=get_valid_user_position_input()
          make_move(position, symbol)
          draw()
        else
          return false         
        end

      end
      puts "Game is a tie"
    end
  end
end
