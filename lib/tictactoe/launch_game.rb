require 'json'

module Tictactoe
    class LaunchGame
        def initialize(json_file, stdin: $stdin)
            @stdin=stdin
            @obj=json_file 

        end

        def choose_language()
            while true
                puts "Enter '1' for English, entrez 2 pour le français, 输入3作为普通话"
                index =@stdin.gets.chomp
                return @obj[index] if @obj[index] 
            end
        end

        def start
            language = choose_language()
        end



    end
end