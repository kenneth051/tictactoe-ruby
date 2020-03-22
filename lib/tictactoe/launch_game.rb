require "json"
require "./lib/tictactoe/game"
require "./lib/tictactoe/validation"
require "./lib/tictactoe/messages"

module Tictactoe
  class LaunchGame
    def initialize(json_file,io,gameInterface)
      @obj = json_file
      @io=io
      @gameInterface = gameInterface
    end

    def choose_language(key = nil)
      while true
        puts "Enter '1' for English, entrez 2 pour le français, 输入3作为普通话"
        key = @io.input
        return @obj[key]["index"] if @obj[key]
      end
    end


    def start()
      @gameInterface.inspect
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES,@io,choose_language().to_i)
      validate = Tictactoe::Validation.new(messages, @io)
      game = Tictactoe::Game.new(validate, messages, @io)
      new_game = @gameInterface.new(game, messages, @io)
      new_game.play()
    end
  end
end
