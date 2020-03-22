require "./lib/tictactoe/launch_game"
require "./lib/tictactoe/console_game"

RSpec.describe Tictactoe::LaunchGame do
  context "#choose_language" do
    it "should output a message to enable users choose a language" do
      json=JSON.parse(File.read("./lib/tictactoe/settings.json"))
      input = FakeStringInput.new(["1","1"])
      io = Tictactoe::OutputInput.new(stdin:input)
      launch_game = Tictactoe::LaunchGame.new(json, io,Tictactoe::ConsoleGame)
      launch_game.choose_language
      expect { launch_game.choose_language }.to output("Enter '1' for English, entrez 2 pour le français, 输入3作为普通话\n").to_stdout
    end
    it "should return a user's language" do
        json=JSON.parse(File.read("./lib/tictactoe/settings.json"))
        input = FakeStringInput.new(["1"])
        io = Tictactoe::OutputInput.new(stdin:input)
        launch_game = Tictactoe::LaunchGame.new(json, io,Tictactoe::ConsoleGame)
        expect(launch_game.choose_language).to be_kind_of(String) 
      end
  end
  context "#start" do
    it "should start and finish the game with a users's language" do
      json=JSON.parse(File.read("./lib/tictactoe/settings.json"))
      inputs=["1","x", "1", "o", "5", "x", "3", "o", "4", "x", "2", "o", "6", "x", "7", "o", "8"]
      input = FakeStringInput.new(inputs)
      io = Tictactoe::OutputInput.new(stdin:input)
      launch_game = Tictactoe::LaunchGame.new(json, io,Tictactoe::ConsoleGame)
      expect{launch_game.start}.to output.to_stdout
    end
  end

end