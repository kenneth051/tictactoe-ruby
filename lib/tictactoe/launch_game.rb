require "json"
require "./lib/tictactoe/game"
require "./lib/tictactoe/validation"
require "./lib/tictactoe/messages"

module Tictactoe
  class LaunchGame
    def initialize(json_file,io)
      @obj = json_file
      @io=io
    end

    def choose_language(key = nil)
      while true
        puts "Enter '1' for English, entrez 2 pour le français, 输入3作为普通话"
        key = @io.input
        return @obj[key]["index"] if @obj[key]
      end
    end


    def start
      language_index = choose_language()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES,@io, language_index.to_i)
      outputinput= Tictactoe::OutputInput.new(messages)
      validate = Tictactoe::Validation.new(messages, @io)
      new_game = Tictactoe::Game.new(validate, messages, @io)
      new_game.play_again
    end
  end
end
