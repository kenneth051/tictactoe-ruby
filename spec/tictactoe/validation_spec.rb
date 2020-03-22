require "./lib/tictactoe/validation"
require "./lib/tictactoe/messages"
require "./spec/tictactoe/fakers"
require "./lib/tictactoe/output_input"

RSpec.describe Tictactoe::Validation do
  context "check_position_range" do
    it "should not allow players to play using positions out of range" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES,io, 0)
      validate = Tictactoe::Validation.new(messages,io)
      expect {
        validate.check_position_range(11)
      }.to output.to_stdout
    end
    it "should only allow players to play using positions in range" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES,io, 0)
      validate = Tictactoe::Validation.new(messages,io)
      expect(validate.check_position_range(2)).to eq(2)
    end
  end

  context "check_board_position" do
    it "should not permit players to play using already played positions" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES,io, 0)
      validate = Tictactoe::Validation.new(messages,io)
      board = ["x", "o", "x", "o"]
      expect {
        validate.check_board_position(2, board)
      }.to output.to_stdout
    end
    it "should only permit players to play using open positions" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES,io, 0)
      validate = Tictactoe::Validation.new(messages,io)
      board = ["-", "-", "-", "-"]
      expect(validate.check_board_position(2, board)).to eq(2)
    end
  end

  context "check_input_symbol" do
    it "should not permit players to play using unknown symbols" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES,io, 0)
      validate = Tictactoe::Validation.new(messages,io)
      expect {
        validate.check_input_symbol("c")
      }.to output.to_stdout
    end
    it "should only permit players to play using known symbol 'o'" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES,io, 0)
      validate = Tictactoe::Validation.new(messages,io)
      expect(validate.check_input_symbol("o")).to eq("o")
    end
    it "should only permit players to play using known symbol 'x'" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES,io, 0)
      validate = Tictactoe::Validation.new(messages,io)
      expect(validate.check_input_symbol("x")).to eq("x")
    end
  end
end
