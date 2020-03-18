require "./lib/tictactoe/game"
RSpec.describe Tictactoe::Board do
  context "board" do
    it "board should have a length of nine" do
      board = Tictactoe::Board.new

      expect(board.positions.length).to eq (9)
    end

    it "draw board" do
      board = Tictactoe::Board.new
      expect { board.draw }.to output(
        " - | - | - 
-----------
 - | - | - 
-----------
 - | - | - 
"
      ).to_stdout
    end
    it "should draw a full board" do
      board = Tictactoe::Board.new
      board.positions = ["X", "O", "X", "O", "X", "O", "X", "O", "X"]
      expect { board.draw }.to output(
        " X | O | X 
-----------
 O | X | O 
-----------
 X | O | X 
"
      ).to_stdout
    end
    it "check if board is not full" do
      board = Tictactoe::Board.new
      expect(board.is_full).to eq (false)
    end
    it "check if board is full" do
      board = Tictactoe::Board.new
      board.positions = Array.new(9, "X")
      expect(board.is_full).to eq (true)
    end
    it "should clear board" do
      board = Tictactoe::Board.new
      board.positions = Array.new(9, "X")
      board.clear_board
      expect(board.positions.count("-")).to be (9)
    end
  end
end
