module Tictactoe
  class OutputInput
    def initialize(message = nil, stdin: $stdin)
      @stdin = stdin
      @message = message
    end

    def output(message)
      puts(message)
    end

    def input
      return @stdin.gets.chomp
    end
  end
end
