require "./lib/tictactoe/board"

module Tictactoe
  print "Welcome to Tic-Tac-Toe"

  class Game
    attr_reader :board

    def initialize
      @symbols = []
      @board = Board.new
    end

    def draw
      @board.draw
    end

    def check_position(pos)
      if @board.positions[pos] != "-"
        raise "Error"
      end
      return true
    end

    def play(move, symbol)
      @symbols.push(symbol)
      if @symbols[-2] and @symbols[-1] and @symbols[-2] == @symbols[-1]
        raise "Error"
      end
      position = move - 1
      @board.positions[position] = symbol
    end

    def winning_combinations(symbol)
      comb1 = @board.positions[0] == symbol && @board.positions[1] == symbol && @board.positions[2] == symbol
      comb2 = @board.positions[3] == symbol && @board.positions[4] == symbol && @board.positions[5] == symbol
      comb3 = @board.positions[6] == symbol && @board.positions[7] == symbol && @board.positions[8] == symbol
      comb4 = @board.positions[0] == symbol && @board.positions[3] == symbol && @board.positions[6] == symbol
      comb5 = @board.positions[1] == symbol && @board.positions[4] == symbol && @board.positions[7] == symbol
      comb6 = @board.positions[2] == symbol && @board.positions[5] == symbol && @board.positions[8] == symbol
      comb7 = @board.positions[0] == symbol && @board.positions[4] == symbol && @board.positions[8] == symbol
      comb8 = @board.positions[2] == symbol && @board.positions[4] == symbol && @board.positions[6] == symbol

      if comb1 || comb2 || comb3 || comb4 || comb5 || comb6 || comb7 || comb8
        return true
      else
        return false
      end
    end

    def check_winner(input)
      print "Player one has won!"
    end
  end
end
