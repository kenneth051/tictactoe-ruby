require "./lib/tictactoe/game"
require "./lib/tictactoe/validation"

RSpec.describe Tictactoe::Game, Tictactoe::Board do
  context "when both players play" do
    it "should signal a draw when the board is full" do
      validate=Tictactoe::Validation.new 
      new_game = Tictactoe::Game.new(validate)
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
