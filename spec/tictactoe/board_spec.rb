require "./lib/output_input"
require "./lib/game"
RSpec.describe Tictactoe::Board do
  context "board" do
    it "board should have a length of nine" do
      io = Tictactoe::OutputInput.new()
      board = Tictactoe::Board.new(io)

      expect(board.positions.length).to eq (9)
    end

    it "draw board" do
      io = Tictactoe::OutputInput.new()
      board = Tictactoe::Board.new(io)
      expect { board.draw }.to output(
      "      - | - | -
      -----------
      - | - | -
      -----------
      - | - | -
"
      ).to_stdout
    end
    it "should draw a full board" do
      io = Tictactoe::OutputInput.new()
      board = Tictactoe::Board.new(io)
      board.positions = ["X", "O", "X", "O", "X", "O", "X", "O", "X"]
      expect { board.draw }.to output(
"      X | O | X
      -----------
      O | X | O
      -----------
      X | O | X
"
      ).to_stdout
    end
    it "check if board is not full" do
      io = Tictactoe::OutputInput.new()
      board = Tictactoe::Board.new(io)
      expect(board.is_full).to eq (false)
    end
    it "check if board is full" do
      io = Tictactoe::OutputInput.new()
      board = Tictactoe::Board.new(io)
      board.positions = Array.new(9, "X")
      expect(board.is_full).to eq (true)
    end
    it "should clear board" do
      io = Tictactoe::OutputInput.new()
      board = Tictactoe::Board.new(io)
      board.positions = Array.new(9, "X")
      board.clear_board
      expect(board.positions.count("-")).to be (9)
    end
  end
end
