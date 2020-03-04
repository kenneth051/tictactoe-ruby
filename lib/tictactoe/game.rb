
module Tictactoe
    print "Welcome to Tic-Tac-Toe"
    
    class Game 
    end
    class Board

        attr_accessor :size
        def initialize()
            @size = Array.new(9,"-")
        end
    end
end
