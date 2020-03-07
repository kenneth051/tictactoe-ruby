require "./lib/tictactoe/game"

RSpec.describe Tictactoe::Game, Tictactoe::Board do
  context "when both players play" do
    xit "should signal a draw when there is no winner" do
      board = Tictactoe::Board.new()
      new_game = Tictactoe::Game.new()

      moves = [["x", 1], ["o", 2], ["x", 3], ["o", 4], ["x", 5], ["o", 6], ["x", 7], ["o", 8], ["x", 9]]

      moves.each do |symbol, move|
        new_game.play()
      end

      expect(new_game.get_winner()).to eq (" IT'S A DRAW!")
    end
  end
end
