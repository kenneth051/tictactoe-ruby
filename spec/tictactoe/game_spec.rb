require "./lib/tictactoe/game"
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
        ["X", 1],
        ["O", 5],
        ["X", 3],
        ["O", 4],
        ["X", 2],
        ["O", 6],
        ["X", 7],
        ["O", 8],
      ]

      moves.each do |symbol, position|
        new_game.make_move(position, symbol)
      end
      expect(new_game.check_winner("X")).to eq(true)
    end
      it "should ensure player two gets to be a  winner" do
        new_game = Tictactoe::Game.new
        moves = [
          ["O", 1],
          ["X", 5],
          ["O", 3],
          ["X", 4],
          ["O", 2],
          ["X", 6],
          ["O", 7],
          ["X", 8],
        ]
  
        moves.each do |symbol, position|
          new_game.make_move(position, symbol)
        end
        expect(new_game.check_winner("O") ).to eq(true)
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

    context "check_position" do
      it "should only permit players to play using open positions" do
        new_game = Tictactoe::Game.new
        moves = [
          ["X", 3],
          ["O", 2],
        ]
        moves.each do |symbol, position|
          new_game.make_move(position, symbol)
        end
        expect {
          new_game.check_position(2)
        }.to raise_error
      end
    end

    context "position_within_range" do
      it "should only permit players to play using positions within range" do
        new_game = Tictactoe::Game.new
        expect {
          new_game.position_within_range(11)
        }.to raise_error Tictactoe::PositionOutOfRange
      end
    end
  end
end
