require "./lib/game"
require "./lib/validation"
require "./spec/tictactoe/fakers"
require "./lib/messages"
require "./lib/output_input"
require "./lib/console_game"
require "./lib/console_validation"

RSpec.describe Tictactoe::Game, Tictactoe::Board do
  context "when both players play" do
    it "should signal a draw when the board is full" do
      input = FakeStringInput.new(["2"])
      io = Tictactoe::OutputInput.new(stdin: input)
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::ConsoleValidation.new(Tictactoe::Validation.new,messages)
      game = Tictactoe::Game.new(messages, io)
      game.board.positions = ["o", "x", "o", "o", "x", "o", "x", "o", "x", "2"]
      new_game = Tictactoe::ConsoleGame.new(game, messages, io,validate)
      expect { new_game.play() }.to output.to_stdout
    end
  end
end
