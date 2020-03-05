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

    def play(move, symbol)
      @symbols.push(symbol)
      if @symbols[-2] and @symbols[-1] and @symbols[-2] == @symbols[-1]
        raise "Error"
      end
      position = move - 1
      @board.size[position] = symbol
    end

    def check_winner(input)
      print "Player one has won!"
    end
  end
end
