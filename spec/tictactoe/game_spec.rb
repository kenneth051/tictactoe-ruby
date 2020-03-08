require "./lib/tictactoe/game"

class FakeStringInput
  def initialize(input)
    @input = input
  end

  def gets
    return @input
  end
end


RSpec.describe Tictactoe::Game do
  context "#draw" do
    it "add position to board" do
      new_game = Tictactoe::Game.new
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
      new_game = Tictactoe::Game.new
      new_game.make_move(1, "X")

      expect {
        new_game.make_move(2, "X")
      }.to raise_error
    end
    it "should ensure that both players play" do
      new_game = Tictactoe::Game.new
      new_game.make_move(1, "X")

      expect {
        new_game.make_move(3, "O")
      }.not_to raise_error
    end
  end

  context "check_winner" do
    it "should ensure player one gets to be a winner" do
      new_game = Tictactoe::Game.new
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
        new_game = Tictactoe::Game.new
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
        expect(new_game.check_winner() ).to eq(true)
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
          new_game.make_move(position, symbol)
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
          new_game.make_move(position, symbol)
        end
        expect(new_game.winning_combinations("X")).to eq (true)
      end

      it "should check for not a winning combination" do
        new_game = Tictactoe::Game.new
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
        new_game = Tictactoe::Game.new
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
        new_game = Tictactoe::Game.new
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
        new_game = Tictactoe::Game.new
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
        new_game = Tictactoe::Game.new
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
        new_game = Tictactoe::Game.new
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
        new_game = Tictactoe::Game.new
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

    context "get_valid_user_position_input" do
      it "should output 'Enter position' the console" do
        input = FakeStringInput.new("1")
        new_game = Tictactoe::Game.new
        expect{new_game.get_valid_user_position_input(stdin:input)}.to output("Enter position\n").to_stdout
      end

      it "should accept input from the console" do
        input = FakeStringInput.new("4")
        new_game = Tictactoe::Game.new
        expect(new_game.get_valid_user_position_input(stdin:input)).to eq(4)
      end
    end
    context "check_input_position" do
      it "should not allow players to play using positions out of range" do
        new_game = Tictactoe::Game.new
        expect {
          new_game.check_input_position(11)
        }.to output("position out of range, enter from 1 to 9\n").to_stdout
      end
      it "should only  allow players to play using positions in range" do
        new_game = Tictactoe::Game.new
        expect(new_game.check_input_position(2)).to eq(2)
      end
    end

    context "check_board_position" do
      it "should not permit players to play using already played positions" do
        new_game = Tictactoe::Game.new
        moves = [
          ["X", 3],
          ["O", 2],
        ]
        moves.each do |symbol, position|
          new_game.make_move(position, symbol)
        end
        expect {
          new_game.check_board_position(2)
        }.to output("position has been taken, choose another one\n").to_stdout
      end
      it "should only permit players to play using open positions" do
        new_game = Tictactoe::Game.new
        expect(new_game.check_board_position(2)).to eq(2)
      end
    end
  end
end
