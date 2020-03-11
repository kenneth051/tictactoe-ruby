require "./lib/tictactoe/game"
require "./spec/tictactoe/fakers"
require "./lib/tictactoe/validation"
require "./lib/tictactoe/messages"

RSpec.describe Tictactoe::Game do
  context "#draw" do
    it "add position to board" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      new_game.make_move(1, "X")
      expect { new_game.draw }.to output(
        " X | - | - 
-----------
 - | - | - 
-----------
 - | - | - 
"
      ).to_stdout
    end
  end

  context "#play" do
    it "should ensure that a player doesnt play twice consecutively" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      new_game.make_move(1, "x")

      expect {
        new_game.make_move(2, ["o", "x"].pop())
      }.to output("You cannot play consecutively\n").to_stdout
    end
    it "should ensure that both players play" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      new_game.make_move(1, "X")

      expect {
        new_game.make_move(3, "O")
      }.not_to raise_error
    end
  end

  context "check_winner" do
    it "should ensure player one gets to be a winner" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["x", 1],
        ["o", 5],
        ["x", 3],
        ["o", 4],
        ["x", 2],
        ["o", 6],
        ["x", 7],
        ["o", 8],
      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.check_winner()).to eq(true)
    end
    it "should ensure player two gets to be a  winner" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["o", 1],
        ["x", 5],
        ["o", 3],
        ["x", 4],
        ["o", 2],
        ["x", 6],
        ["o", 7],
        ["x", 8],
      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.check_winner()).to eq(true)
    end
  end

  context "winning combinations" do
    it "should check for first winning combinations" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["X", 1], #
        ["O", 5],
        ["X", 2], #
        ["O", 4],
        ["X", 3], #

      ]
      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for second winning combinations" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["X", 4], #
        ["O", 3],
        ["X", 6], #
        ["O", 2],
        ["X", 5], #

      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end

    it "should check for not a winning combination" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["X", 4], #
        ["O", 3],
        ["X", 6], #
        ["O", 2],
      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (false)
    end

    it "should check for third winning combinations" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["X", 7], #
        ["O", 3],
        ["X", 8], #
        ["O", 2],
        ["X", 9], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for fourth winning combinations" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["X", 7], #
        ["O", 3],
        ["X", 4], #
        ["O", 6],
        ["X", 1], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for fifth winning combinations" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["X", 2], #
        ["O", 3],
        ["X", 5], #
        ["O", 7],
        ["X", 8], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for sixth winning combinations" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["X", 3], #
        ["O", 4],
        ["X", 6], #
        ["O", 7],
        ["X", 9], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for seventh winning combinations" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["X", 1], #
        ["O", 2],
        ["X", 5], #
        ["O", 7],
        ["X", 9], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for eigth winning combinations" do
      validate = FakeValidation.new
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages)
      moves = [
        ["X", 3], #
        ["O", 2],
        ["X", 5], #
        ["O", 1],
        ["X", 7], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
  end

  context "get_position" do
    it "should output 'Enter position' the console" do
      input = FakeStringInput.new(["1"])
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      validate = Tictactoe::Validation.new(messages)
      new_game = Tictactoe::Game.new(validate, messages, stdin: input)
      expect { new_game.get_position }.to output("Enter position\n").to_stdout
    end
    it "should accept input from the console" do
      input = FakeStringInput.new(["4"])
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      validate = Tictactoe::Validation.new(messages)
      new_game = Tictactoe::Game.new(validate, messages, stdin: input)
      expect(new_game.get_position).to eq(4)
    end
    it "should print error message if position input is invalid" do
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      validate = Tictactoe::Validation.new(messages)
      input = FakeStringInput.new(["20", "5"])
      new_game = Tictactoe::Game.new(validate, messages, stdin: input)
      expect {
        symbol = new_game.get_position
      }.to output(/out of range/).to_stdout
    end
  end

  context "get_symbol" do
    it "should return symbol input if it's valid" do
      validate = FakeValidation.new
      input = FakeStringInput.new(["o"])
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      new_game = Tictactoe::Game.new(validate, messages, stdin: input)
      expect(new_game.get_symbol).to eq("o")
    end
    it "should print error message if symbol input is invalid" do
      input = FakeStringInput.new(["r", "x"])
      messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
      validate = Tictactoe::Validation.new(messages)
      new_game = Tictactoe::Game.new(validate, messages, stdin: input)
      expect {
        symbol = new_game.get_symbol
        expect(symbol).to eq("x")
      }.to output(/invalid input/).to_stdout
    end
    context "play" do
      it "should signal when a user using 'x' wins" do
        inputs = ["x", "1", "o", "5", "x", "3", "o", "4", "x", "2", "o", "6", "x", "7", "o", "8"]
        input = FakeStringInput.new(inputs)
        validate = FakeValidation.new
        messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
        new_game = Tictactoe::Game.new(validate, messages, stdin: input)
        expect { new_game.play() }.to output(/Player using 'x' has won!/).to_stdout
      end
      it "should signal when a player using 'o' wins" do
        inputs = ["o", "1", "x", "5", "o", "3", "x", "4", "o", "2", "x", "6", "o", "7", "x", "8"]
        input = FakeStringInput.new(inputs)
        validate = FakeValidation.new
        messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
        new_game = Tictactoe::Game.new(validate, messages, stdin: input)
        expect { new_game.play() }.to output(/Player using 'o' has won!/).to_stdout
      end
      it "should signal when a user plays with an invalid symbol" do
        inputs = ["e", "x", "2", "o", "1", "x", "4", "o", "3", "x", "6", "o", "5", "x", "7", "o", "8", "x", "9"]
        input = FakeStringInput.new(inputs)
        messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
        validate = Tictactoe::Validation.new(messages)
        new_game = Tictactoe::Game.new(validate, messages, stdin: input)
        expect { new_game.play() }.to output(/invalid input, symbol be either 'x' or 'o' lowercase/).to_stdout
      end
      it "should signal when a user plays with an invalid position" do
        inputs = ["x", "20", "2", "o", "1", "x", "4", "o", "3", "x", "6", "o", "5", "x", "7", "o", "8", "x", "9"]
        input = FakeStringInput.new(inputs)
        messages = Tictactoe::Messages.new(ALL_MESSAGES, 0)
        validate = Tictactoe::Validation.new(messages)
        new_game = Tictactoe::Game.new(validate, messages, stdin: input)
        expect { new_game.play() }.to output(/position out of range, enter from 1 to 9/).to_stdout
      end
    end
  end
end
