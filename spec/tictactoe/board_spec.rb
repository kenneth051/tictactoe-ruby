require "./lib/tictactoe/game"
RSpec.describe Tictactoe::Board do

  context "board" do
    it "board should have a length of nine" do
      board = Tictactoe::Board.new

      expect(board.positions.length).to eq (9)
    end

    it "draw board" do
        board = Tictactoe::Board.new
        expect{board.draw}.to output(
" - | - | -
---|---|---
 - | - | -
---|---|---
 - | - | -

---------------
").to_stdout
      end
  end
end
