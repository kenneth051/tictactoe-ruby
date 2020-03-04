require "./lib/tictactoe/game"
RSpec.describe Tictactoe::Board, Tictactoe::Game do

  context "board" do
    it "board should have a length of nine" do
      board = Tictactoe::Board.new()

      expect(board.size.length()).to eq (9)
    end

    it "draw board" do
        board = Tictactoe::Board.new()
        expect{board.draw()}.to output(
" - | - | -
---|---|---
 - | - | -
---|---|---
 - | - | -

---------------
").to_stdout
      end

      it "add position to board" do
        new_game = Tictactoe::Game.new()
        new_game.play(1,'X')
        expect{new_game.draw()}.to output(
" X | - | -
---|---|---
 - | - | -
---|---|---
 - | - | -

---------------
").to_stdout
      end
    

  end
end
