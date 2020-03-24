require "json"
require_relative "./game"
require_relative "./validation"
require_relative "./messages"
require_relative "./console_validation"

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
      validate = Tictactoe::ConsoleValidation.new(Tictactoe::Validation.new,messages)
      game = Tictactoe::Game.new(messages, @io)
      new_game = @gameInterface.new(game, messages, @io,validate)
      new_game.play()
    end
  end
end
