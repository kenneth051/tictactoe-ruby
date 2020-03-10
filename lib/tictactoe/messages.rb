module Tictactoe
  class Messages
    def initialize(messages)
      @messages = messages
    end

    def get_message(key)
      return @messages[key]
    end
  end
end
