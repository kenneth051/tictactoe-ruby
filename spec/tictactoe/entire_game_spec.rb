require "./lib/tictactoe/game"
require "./lib/tictactoe/validation"
require "./spec/tictactoe/fakers"
require "./lib/tictactoe/messages"

RSpec.describe Tictactoe::Game, Tictactoe::Board do
  context "when both players play" do
    it "should signal a draw when the board is full" do
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, 0)
      validate = Tictactoe::Validation.new(messages)
      new_game = Tictactoe::Game.new(validate, messages)
      new_game.board.positions = ["x", "o", "x", "o", "x", "o", "x", "o", "x"]

      expect { new_game.play() }.to output(
        " x | o | x 
-----------
 o | x | o 
-----------
 x | o | x 
 IT'S A DRAW!
"
      ).to_stdout
    end
  end
end
