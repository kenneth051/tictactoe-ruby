module Tictactoe
  class OutputInput
    def initialize(stdin: $stdin)
      @stdin = stdin
    end

    def output(message)
      puts(message)
    end

    def input
      return @stdin.gets.chomp
    end
  end
end
