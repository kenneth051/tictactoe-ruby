require "./lib/tictactoe/game"
RSpec.describe Tictactoe::Game, Tictactoe::Board do

  context "when both players play" do
    xit "should signal a draw when there is no winner" do

      board = Tictactoe::Board.new()
      new_game = Tictactoe::Game.new(board)

      player_one_moves = [1,3,5,8]
      player_two_moves = [2,4,6,7,9]

      player_one_moves.each do |moves|
        new_game.play(p1_moves,"O")
      end

      player_two_moves.each do |moves|
        new_game.play(p2_moves,"X")
      end

      expect(new_game.get_winner()).to eq (" IT'S A DRAW!")
    end
  end
end
