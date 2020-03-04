require "./lib/tictactoe/game"
RSpec.describe Tictactoe::Board do

  context "board" do
    it "board should have a length of nine" do
      board = Tictactoe::Board.new()

      expect(board.size.length()).to eq (9)
    end
  end
end
