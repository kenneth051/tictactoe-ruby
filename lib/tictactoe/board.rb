module Tictactoe
  class Board
    attr_accessor :positions

    def initialize()
      @positions = Array.new(9, "-")
    end

    def draw
      print " #{positions[0]} | #{positions[1]} | #{positions[2]} \n"
      print "-----------\n"
      print " #{positions[3]} | #{positions[4]} | #{positions[5]} \n"
      print "-----------\n"
      puts " #{positions[6]} | #{positions[7]} | #{positions[8]} "
    end

    def is_not_full
      return true if @positions.count("-") >0
    end
  end
end
