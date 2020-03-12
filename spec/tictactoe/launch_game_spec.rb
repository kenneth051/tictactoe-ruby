require "./lib/tictactoe/launch_game"

RSpec.describe Tictactoe::LaunchGame do
  context "#choose_language" do
    it "should output a message to enable users choose a language" do
      json=JSON.parse(File.read("./lib/tictactoe/settings.json"))
      input = FakeStringInput.new(["1","1"])
      launch_game = Tictactoe::LaunchGame.new(json, stdin:input)
      launch_game.choose_language
      expect { launch_game.choose_language }.to output("Enter '1' for English, entrez 2 pour le français, 输入3作为普通话\n").to_stdout
    end
    it "should return a user's language" do
        json=JSON.parse(File.read("./lib/tictactoe/settings.json"))
        input = FakeStringInput.new(["1","1"])
        launch_game = Tictactoe::LaunchGame.new(json, stdin:input)
        expect(launch_game.choose_language).to have_key("language") 
      end
  end
  context "#start" do
    it "should output a message to enable users choose a language" do
      json=JSON.parse(File.read("./lib/tictactoe/settings.json"))
      input = FakeStringInput.new(["1","3"])
      launch_game = Tictactoe::LaunchGame.new(json, stdin:input)
      expect { launch_game.start }.to output("Enter '1' for English, entrez 2 pour le français, 输入3作为普通话\n").to_stdout
    end
  end
  
end