require "./lib/validation"
require "./lib/messages"
require "./lib/console_validation"

RSpec.describe Tictactoe::ConsoleValidation do
  context "check_position_range" do
    it "return true if position is in range 1-9" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::ConsoleValidation.new(Tictactoe::Validation.new, messages)
      expect(validate.check_position_range(8)).to eql(true)
    end
    it "return nil if position is not in range 1-9" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::ConsoleValidation.new(Tictactoe::Validation.new, messages)
      expect { validate.check_position_range(10) }.to output.to_stdout
    end
  end
  context "#check_input_symbol" do
    it "input symbol should be 'x'" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::ConsoleValidation.new(Tictactoe::Validation.new, messages)
      expect(validate.check_input_symbol("x")).to eql(true)
    end
    it "input symbol should be 'o'" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::ConsoleValidation.new(Tictactoe::Validation.new, messages)
      expect(validate.check_input_symbol("o")).to eql(true)
    end
    it "return nil if input symbol is not 'x' or 'o'" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::ConsoleValidation.new(Tictactoe::Validation.new, messages)
      expect { validate.check_input_symbol("i") }.to output.to_stdout
    end
  end
  context "check_board_position" do
    it "return true if position on board is available" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::ConsoleValidation.new(Tictactoe::Validation.new, messages)
      expect(validate.check_board_position(1, ["-", "-", "-", "-", "-", "-"])).to eql(true)
    end
    it "return nil if position on board has been taken" do
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::ConsoleValidation.new(Tictactoe::Validation.new, messages)
      expect { validate.check_board_position(2, ["x", "o", "x", "o", "x", "o"]) }.to output.to_stdout
    end
  end
end
