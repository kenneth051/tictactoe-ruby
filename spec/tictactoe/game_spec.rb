require "./lib/tictactoe/game"
RSpec.describe Tictactoe::Game do
  context "#draw" do
    it "add position to board" do
      new_game = Tictactoe::Game.new
      new_game.play(1, "X")
      expect { new_game.draw }.to output(
        " X | - | -
---|---|---
 - | - | -
---|---|---
 - | - | -

---------------
"
      ).to_stdout
    end
  end

  context "#play" do
    it "should ensure that a player doesnt play twice consecutively" do
      new_game = Tictactoe::Game.new
      new_game.play(1, "X")

      expect {
        new_game.play(2, "X")
      }.to raise_error
    end
  end

  context "check_winner" do
    it "should check for a winner" do
      new_game = Tictactoe::Game.new
      moves = [
        ["X", 0],
        ["O", 4],
        ["X", 2],
        ["O", 3],
        ["X", 1],
        ["O", 5],
        ["X", 6],
        ["O", 7],
      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect { new_game.check_winner("X") }.to output("Player one has won!").to_stdout
    end
    it "should check for a winner using the first winning combination" do
      new_game = Tictactoe::Game.new
      moves = [
        ["O", 0],
        ["X", 5],
        ["O", 2],
        ["X", 6],
        ["O", 1],
        ["X", 9],
      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect { new_game.check_winner("X") }.to output("Player one has won!").to_stdout
    end
  end
  context "winning combinations" do
    it "should check for first winning combinations" do
      new_game = Tictactoe::Game.new
      moves = [
        ["X", 1], #
        ["O", 5],
        ["X", 2], #
        ["O", 4],
        ["X", 3], #

      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for second winning combinations" do
      new_game = Tictactoe::Game.new
      moves = [
        ["X", 4], #
        ["O", 3],
        ["X", 6], #
        ["O", 2],
        ["X", 5], #

      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for third winning combinations" do
      new_game = Tictactoe::Game.new
      moves = [
        ["X", 7], #
        ["O", 3],
        ["X", 8], #
        ["O", 2],
        ["X", 9], #
      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for fourth winning combinations" do
      new_game = Tictactoe::Game.new
      moves = [
        ["X", 7], #
        ["O", 3],
        ["X", 4], #
        ["O", 6],
        ["X", 1], #
      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for fifth winning combinations" do
      new_game = Tictactoe::Game.new
      moves = [
        ["X", 2], #
        ["O", 3],
        ["X", 5], #
        ["O", 7],
        ["X", 8], #
      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for sixth winning combinations" do
      new_game = Tictactoe::Game.new
      moves = [
        ["X", 3], #
        ["O", 4],
        ["X", 6], #
        ["O", 7],
        ["X", 9], #
      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for seventh winning combinations" do
      new_game = Tictactoe::Game.new
      moves = [
        ["X", 1], #
        ["O", 2],
        ["X", 5], #
        ["O", 7],
        ["X", 9], #
      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
    it "should check for eigth winning combinations" do
      new_game = Tictactoe::Game.new
      moves = [
        ["X", 3], #
        ["O", 2],
        ["X", 5], #
        ["O", 1],
        ["X", 7], #
      ]

      moves.each do |symbol, position|
        new_game.play(position, symbol)
      end
      expect(new_game.winning_combinations("X")).to eq (true)
    end
  end
end
