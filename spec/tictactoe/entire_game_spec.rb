require "./lib/tictactoe/game"
require "./lib/tictactoe/validation"
require "./spec/tictactoe/fakers"
require "./lib/tictactoe/messages"
require "./lib/tictactoe/output_input"

RSpec.describe Tictactoe::Game, Tictactoe::Board do
  context "when both players play" do
    it "should signal a draw when the board is full" do
      input = FakeStringInput.new(["2"])
      io = Tictactoe::OutputInput.new(stdin:input)
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES,io, 0)
      validate = Tictactoe::Validation.new(messages,io)
      new_game = Tictactoe::Game.new(validate, messages,io)
      new_game.board.positions = ["o", "x", "o", "o", "x", "o", "x", "o", "x","2"]
      expect { new_game.play() }.to output.to_stdout
    end
  end
end
