
require "./lib/tictactoe/launch_game"

RSpec.describe Tictactoe::LaunchGame do
  context "when user chooses a language" do
    it "should lauch game" do
      launch_game = Tictactoe::LaunchGame.new
      launch_game.start
      expect { launch_game.start }.to output("choose a language, choisissez une langue, 语言选择\n").to_stdout
    end
  end
end