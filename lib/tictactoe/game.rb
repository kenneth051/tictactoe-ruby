
module Tictactoe
    print "Welcome to Tic-Tac-Toe"
    
    class Game 
    end
    class Board

        attr_accessor :size
        def initialize()
            @size = Array.new(9,"-")
        end

        def draw()
            first_row = " "+  @size[0] + " | " +  @size[1] + " | " + @size[2] +"\n"
            separator = "---|---|---" +"\n"
            second_row = " "+  @size[3] +" | " +  @size[4] + " | "+  @size[5] +"\n"
            third_row = " "+  @size[6] +" | " +  @size[7] + " | "+  @size[8] +"\n"
            space = ""+"\n"
            board_separator = "---------------"+"\n"
            body = first_row+separator+second_row+separator+third_row+space+board_separator
            puts body
        end
    end
end
