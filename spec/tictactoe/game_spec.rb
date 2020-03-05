require "./lib/tictactoe/game"
RSpec.describe Tictactoe::Game do
  context "#draw" do
    it "add position to board" do
      new_game = Tictactoe::Game.new
      new_game.play(1, "X")
      expect { new_game.draw }.to output(
        " X | - | -
---|---|---
 - | - | -
---|---|---
 - | - | -

---------------
"
      ).to_stdout
    end
  end

  context "#play" do
    it "should ensure that a player doesnt play twice consecutively" do
      new_game = Tictactoe::Game.new
      new_game.play(1, "X")

      expect {
        new_game.play(2, "X")
      }.to raise_error
    end
  end

  context "check_winner" do
    it "should check for a winner" do
      new_game = Tictactoe::Game.new
      moves = [
        ["X", 0],
        ["O", 4],
        ["X", 2],
        ["O", 3],
        ["X", 1],
        ["O", 5],
        ["X", 6],
        ["O", 7],
      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect { new_game.check_winner("X") }.to output("Player one has won!").to_stdout
    end
  end
end
