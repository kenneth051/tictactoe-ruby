require "./lib/tictactoe/validation"

RSpec.describe Tictactoe::Validation do
  context "check_position_range" do
    it "should not allow players to play using positions out of range" do
      validate = Tictactoe::Validation.new
      expect {
        validate.check_position_range(11)
      }.to output("position out of range, enter from 1 to 9\n").to_stdout
    end
    it "should only allow players to play using positions in range" do
      validate = Tictactoe::Validation.new
      expect(validate.check_position_range(2)).to eq(2)
    end
  end

  context "check_board_position" do
    it "should not permit players to play using already played positions" do
      validate = Tictactoe::Validation.new
      board = ["x", "o", "x", "o"]
      expect {
        validate.check_board_position(2, board)
      }.to output("position has been taken, choose another one\n").to_stdout
    end
    it "should only permit players to play using open positions" do
      validate = Tictactoe::Validation.new
      board = ["-", "-", "-", "-"]
      expect(validate.check_board_position(2, board)).to eq(2)
    end
  end

  context "check_input_symbol" do
    it "should not permit players to play using unknown symbols" do
      validate = Tictactoe::Validation.new
      expect {
        validate.check_input_symbol("c")
      }.to output("invalid input, symbol be either 'x' or 'o' lowercase\n").to_stdout
    end
    it "should only permit players to play using known symbol 'o'" do
      validate = Tictactoe::Validation.new
      expect(validate.check_input_symbol("o")).to eq("o")
    end
    it "should only permit players to play using known symbol 'x'" do
      validate = Tictactoe::Validation.new
      expect(validate.check_input_symbol("x")).to eq("x")
    end
  end
end
