require "./lib/tictactoe/game"
require "./spec/tictactoe/fakers"
require "./lib/tictactoe/validation"
require "./lib/tictactoe/messages"
require "./lib/tictactoe/output_input"
require "./lib/tictactoe/console_game"

RSpec.describe Tictactoe::Game do
  context "#draw" do
    it "add position to board" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io)
      new_game.make_move("x", 1)
      expect { new_game.draw }.to output(
        " x | - | - 
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
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      game = Tictactoe::Game.new(validate, messages, io)
      new_game = Tictactoe::ConsoleGame.new(game, messages, io)
      new_game.make_move("x", 1)

      expect {
        new_game.make_move(["o", "x"].pop(), 2)
      }.to output("You cannot play consecutively\n").to_stdout
    end
    it "should ensure that both players play" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      game = Tictactoe::Game.new(validate, messages, io)
      new_game = Tictactoe::ConsoleGame.new(game, messages, io)
      new_game.make_move("x", 1)

      expect {
        new_game.make_move("o", 3)
      }.not_to raise_error
    end
  end

  context "check_winner" do
    it "should ensure player using 'x' gets to be a winner" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      game = Tictactoe::Game.new(validate, messages, io)
      new_game = Tictactoe::ConsoleGame.new(game, messages, io)
      moves = [
        ["x", 1],
        ["o", 5],
        ["x", 3],
        ["o", 4],
        ["x", 2],
        ["o", 8],
        ["x", 7],
      ]

      moves.each do |symbol, position|
        new_game.make_move(symbol, position)
      end
      expect(game.check_winner()).to eq([true, "x"])
    end
    it "should ensure player using 'o' gets to be a  winner" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      game = Tictactoe::Game.new(validate, messages, io)
      new_game = Tictactoe::ConsoleGame.new(game, messages, io)
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
        new_game.make_move(symbol, position)
      end
      expect(game.check_winner()).to eq([true, "o"])
    end
  end
  context "win?" do
    it "should ensure #output_winning_message gets called" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = FakeMessages.new
      new_game = Tictactoe::Game.new(validate, messages, io)
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
        new_game.make_move(symbol, position)
      end
      expect(new_game).to receive(:output_winning_message).with("o")
      new_game.win?
    end
  end
  context "output_winning_message" do
    it "should ensure winning_message gets called" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = FakeMessages.new
      new_game = Tictactoe::Game.new(validate, messages, io)
      expect(messages).to receive(:winning_message).with("o")
      new_game.output_winning_message("o")
    end
  end
  context "#draw?" do
    it "should check for a draw by checking the board state" do
      validate = FakeValidation.new
      board = FakeBoard.new(true)
      io = Tictactoe::OutputInput.new()
      messages = FakeMessages.new
      new_game = Tictactoe::Game.new(validate, messages, io, board)
      new_game.draw?
      expect(messages.draw_message_is_called).to eq(true)
    end
    it "should check for a draw and call a draw message function" do
      validate = FakeValidation.new
      board = FakeBoard.new(true)
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io, board)
      expect(messages).to receive(:draw_message).with(no_args)
      new_game.draw?
    end
    it "should check if there is no draw" do
      validate = FakeValidation.new
      board = FakeBoard.new(false)
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io, board)
      expect(new_game.draw?).to eql(nil)
    end
  end
  context "prepare_new_game" do
    it "should prepare a game for a new game" do
      validate = FakeValidation.new
      board = FakeBoard.new(true)
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io, board)
      expect(board).to receive(:clear_board).with(no_args)
      new_game.prepare_new_game
    end
    it "should reset played symbols array to empty" do
      validate = FakeValidation.new
      board = FakeBoard.new(true)
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io, board)
      new_game.symbols = ["x", "o", "x"]
      new_game.prepare_new_game
      expect(new_game.symbols).to eql([])
    end
  end

  context "winning combinations" do
    it "should check for first winning combinations" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io)
      moves = [
        ["X", 1], #
        ["O", 5],
        ["X", 2], #
        ["O", 4],
        ["X", 3], #

      ]
      moves.each do |symbol, position|
        new_game.make_move(symbol, position)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for second winning combinations" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io)
      moves = [
        ["X", 4], #
        ["O", 3],
        ["X", 6], #
        ["O", 2],
        ["X", 5], #

      ]

      moves.each do |symbol, position|
        new_game.make_move(symbol, position)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end

    it "should check for not a winning combination" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io)
      moves = [
        ["X", 4], #
        ["O", 3],
        ["X", 6], #
        ["O", 2],
      ]

      moves.each do |symbol, position|
        new_game.make_move(symbol, position)
      end
      expect(new_game.winning_combinations("X")).to eq (false)
    end

    it "should check for third winning combinations" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io)
      moves = [
        ["X", 7], #
        ["O", 3],
        ["X", 8], #
        ["O", 2],
        ["X", 9], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(symbol, position)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for fourth winning combinations" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io)
      moves = [
        ["X", 7], #
        ["O", 3],
        ["X", 4], #
        ["O", 6],
        ["X", 1], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(symbol, position)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for fifth winning combinations" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io)
      moves = [
        ["X", 2], #
        ["O", 3],
        ["X", 5], #
        ["O", 7],
        ["X", 8], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(symbol, position)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for sixth winning combinations" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io)
      moves = [
        ["X", 3], #
        ["O", 4],
        ["X", 6], #
        ["O", 7],
        ["X", 9], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(symbol, position)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for seventh winning combinations" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io)
      moves = [
        ["X", 1], #
        ["O", 2],
        ["X", 5], #
        ["O", 7],
        ["X", 9], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(symbol, position)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for eigth winning combinations" do
      validate = FakeValidation.new
      io = Tictactoe::OutputInput.new()
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      new_game = Tictactoe::Game.new(validate, messages, io)
      moves = [
        ["X", 3], #
        ["O", 2],
        ["X", 5], #
        ["O", 1],
        ["X", 7], #
      ]

      moves.each do |symbol, position|
        new_game.make_move(symbol, position)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
  end

  context "get_position" do
    it "should output 'Enter position' the console" do
      input = FakeStringInput.new(["1"])
      io = Tictactoe::OutputInput.new(stdin: input)
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::Validation.new(messages, io)
      game = Tictactoe::Game.new(validate, messages, io)
      new_game = Tictactoe::ConsoleGame.new(game, messages, io)
      expect { new_game.get_position }.to output.to_stdout
    end
    it "should accept input from the console" do
      input = FakeStringInput.new(["4"])
      io = Tictactoe::OutputInput.new(stdin: input)
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::Validation.new(messages, io)
      game = Tictactoe::Game.new(validate, messages, io)
      new_game = Tictactoe::ConsoleGame.new(game, messages, io)
      expect(new_game.get_position).to eq(4)
    end
    it "should print error message if position input is invalid" do
      input = FakeStringInput.new(["x", "20", "5"])
      io = Tictactoe::OutputInput.new(stdin: input)
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::Validation.new(messages, io)
      game = Tictactoe::Game.new(validate, messages, io)
      new_game = Tictactoe::ConsoleGame.new(game, messages, io)
      expect {
        symbol = new_game.get_position
      }.to output.to_stdout
    end
  end

  context "get_symbol" do
    it "should return symbol input if it's valid" do
      validate = FakeValidation.new
      input = FakeStringInput.new(["o"])
      io = Tictactoe::OutputInput.new(stdin: input)
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      game = Tictactoe::Game.new(validate, messages, io)
      new_game = Tictactoe::ConsoleGame.new(game, messages, io)
      expect(new_game.get_symbol).to eq("o")
    end
    it "should print error message if symbol input is invalid" do
      input = FakeStringInput.new(["r", "x"])
      io = Tictactoe::OutputInput.new(stdin: input)
      messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
      validate = Tictactoe::Validation.new(messages, io)
      game = Tictactoe::Game.new(validate, messages, io)
      new_game = Tictactoe::ConsoleGame.new(game, messages, io)
      expect {
        symbol = new_game.get_symbol
        expect(symbol).to eq("x")
      }.to output.to_stdout
    end
    context "play" do
      it "should signal when a user using 'x' wins" do
        inputs = ["x", "1", "o", "5", "x", "3", "o", "4", "x", "2", "o", "6", "x", "7", "o", "8", "2", "7", "9"]
        input = FakeStringInput.new(inputs)
        io = Tictactoe::OutputInput.new(stdin: input)
        validate = FakeValidation.new
        messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect { new_game.play() }.to output.to_stdout
      end
      it "should signal when a player using 'o' wins" do
        inputs = ["o", "1", "x", "5", "o", "3", "x", "4", "o", "2", "x", "6", "o", "7", "x", "8", "2"]
        input = FakeStringInput.new(inputs)
        io = Tictactoe::OutputInput.new(stdin: input)
        validate = FakeValidation.new
        messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect { new_game.play() }.to output.to_stdout
      end
      it "should signal when a user plays with an invalid symbol" do
        inputs = ["e", "x", "2", "o", "1", "x", "4", "o", "3", "x", "6", "o", "5", "x", "7", "o", "8", "x", "9", "2"]
        input = FakeStringInput.new(inputs)
        io = Tictactoe::OutputInput.new(stdin: input)
        messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
        validate = Tictactoe::Validation.new(messages, io)
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect { new_game.play() }.to output.to_stdout
      end
      it "should signal when a user plays with an invalid position" do
        inputs = ["x", "20", "2", "o", "1", "x", "4", "o", "3", "x", "6", "o", "5", "x", "7", "o", "8", "x", "9", "2"]
        input = FakeStringInput.new(inputs)
        io = Tictactoe::OutputInput.new(stdin: input)
        messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
        validate = Tictactoe::Validation.new(messages, io)
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect { new_game.play() }.to output.to_stdout
      end
      it "should take note of positions already played" do
        inputs = ["x", "2", "o", "2", "1", "x", "4", "o", "3", "x", "6", "o", "5", "x", "7", "o", "8", "x", "9", "1"]
        input = FakeStringInput.new(inputs)
        io = Tictactoe::OutputInput.new(stdin: input)
        messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
        validate = Tictactoe::Validation.new(messages, io)
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect { new_game.play() }.to output.to_stdout
      end
      it "should test function calls" do
        inputs = ["o", "1", "x", "5", "o", "3", "x", "4", "o", "2", "4"]
        input = FakeStringInput.new(inputs)
        io = Tictactoe::OutputInput.new(stdin: input)
        validate = FakeValidation.new
        messages = FakeMessages.new
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect(new_game).to receive(:play_again_input).with(no_args)
        expect(game).to receive(:win?).with(no_args)
        expect(game).to receive(:draw?).with(no_args)
        expect(game).to receive(:prepare_new_game).with(no_args)
        expect(game).to receive(:end?).with(no_args)
        new_game.play
      end
    end
    context "play_again_input" do
      it "should ask a user input to play again" do
        input = FakeStringInput.new(["1"])
        io = Tictactoe::OutputInput.new(stdin: input)
        messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
        validate = Tictactoe::Validation.new(messages, io)
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect(new_game.play_again_input).to eq(true)
      end
      it "should return nil if input is not 1" do
        input = FakeStringInput.new(["2"])
        io = Tictactoe::OutputInput.new(stdin: input)
        messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
        validate = Tictactoe::Validation.new(messages, io)
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect(new_game.play_again_input).to eq(nil)
      end
      it "should call for input from a user" do
        input = FakeStringInput.new(["2"])
        io = Tictactoe::OutputInput.new(stdin: input)
        messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
        validate = Tictactoe::Validation.new(messages, io)
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect(io).to receive(:input).with(no_args)
        new_game.play_again_input
      end
    end
    context "play_again" do
      it "should quit if input entered is not 1 after game has been won or drawn" do
        inputs = ["o", "1", "x", "5", "o", "3", "x", "4", "o", "2", "3"]
        input = FakeStringInput.new(inputs)
        io = Tictactoe::OutputInput.new(stdin: input)
        validate = FakeValidation.new
        messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect { new_game.play_again() }.to output.to_stdout
      end

      it "players can play again" do
        inputs = ["o", "1", "x", "5", "o", "3", "x", "4", "o", "2", "1", "o", "1", "x", "5", "o", "3", "x", "4", "o", "2", "3"]
        input = FakeStringInput.new(inputs)
        io = Tictactoe::OutputInput.new(stdin: input)
        validate = FakeValidation.new
        messages = Tictactoe::Messages.new(Tictactoe::ALL_MESSAGES, io, 0)
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect { new_game.play_again() }.to output.to_stdout
      end

      it "players can play again expect winning message to be called twice" do
        inputs = ["o", "1", "x", "5", "o", "3", "x", "4", "o", "2", "1", "o", "1", "x", "5", "o", "3", "x", "4", "o", "2", "3"]
        input = FakeStringInput.new(inputs)
        io = Tictactoe::OutputInput.new(stdin: input)
        validate = FakeValidation.new
        messages = FakeMessages.new
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect(messages).to receive(:winning_message).with("o").exactly(2).times
        new_game.play_again
      end
      it "players can play again expect win? method to be called twice" do
        inputs = ["o", "1", "x", "5", "o", "3", "x", "4", "o", "2", "1", "o", "1", "x", "5", "o", "3", "x", "4", "o", "2", "3"]
        input = FakeStringInput.new(inputs)
        io = Tictactoe::OutputInput.new(stdin: input)
        validate = FakeValidation.new
        messages = FakeMessages.new
        game = Tictactoe::Game.new(validate, messages, io)
        new_game = Tictactoe::ConsoleGame.new(game, messages, io)

        expect(game).to receive(:win?).with(no_args).exactly(2).times
        new_game.play_again
      end
    end
  end
end
