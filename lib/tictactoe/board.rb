module Tictactoe
  class Board
    attr_accessor :positions

    def initialize()
      @positions = Array.new(9, "-")
    end

    def draw
      first_row = " #{@positions[0]} | #{@positions[1]} | #{@positions[2]}\n"
      separator = "---|---|---" + "\n"
      second_row = " #{@positions[3]} | #{@positions[4]} | #{@positions[5]}\n"
      third_row = " #{@positions[6]} | #{@positions[7]} | #{@positions[8]}\n"
      space = "" + "\n"
      board_separator = "---------------" + "\n"
      body = first_row + separator + second_row + separator + third_row + space + board_separator
      puts body
    end
  end
end
