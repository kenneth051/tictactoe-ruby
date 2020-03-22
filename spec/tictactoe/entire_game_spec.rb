require "./lib/tictactoe/game"
require "./lib/tictactoe/validation"
require "./spec/tictactoe/fakers"
require "./lib/tictactoe/messages"
require "./lib/tictactoe/output_input"
require "./lib/tictactoe/console_game"

RSpec.describe Tictactoe::Game, Tictactoe::Board do
  context "when both players play" do
    it "should signal a draw when the board is full" do
      input = FakeStringInput.new(["2"])
      io = Tictactoe::OutputInput.new(stdin: input)
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::Validation.new(messages, io)
      game = Tictactoe::Game.new(validate, messages, io)
      game.board.positions = ["o", "x", "o", "o", "x", "o", "x", "o", "x", "2"]
      new_game = Tictactoe::ConsoleGame.new(game, messages, io)
      expect { new_game.play() }.to output.to_stdout
    end
  end
end
