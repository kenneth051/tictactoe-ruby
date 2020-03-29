module Tictactoe
  class Board
    attr_accessor :positions

    def initialize(io)
      @positions = Array.new(9, "-")
      @io = io
    end

    def draw
      board = <<-HEREDOC
      #{positions[0]} | #{positions[1]} | #{positions[2]}
      -----------
      #{positions[3]} | #{positions[4]} | #{positions[5]}
      -----------
      #{positions[6]} | #{positions[7]} | #{positions[8]}
      HEREDOC

      @io.output(board)
    end

    def is_full
      @positions.count("-") == 0
    end

    def clear_board
      @positions = Array.new(9, "-")
    end
  end
end
