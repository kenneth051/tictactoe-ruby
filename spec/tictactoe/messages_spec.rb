require "./lib/tictactoe/messages"
RSpec.describe Tictactoe::Messages do
  context "#get_message" do
    it "should return nil if message key is invalid" do
      messages = { "one" => "1" }
      message = Tictactoe::Messages.new([messages],nil, 0)
      expect(message.get_message("two")).to eq(nil)
    end
    it "should return a message from a specific hash list" do
      messages = { "one" => "1", "two" => "2" }
      message = Tictactoe::Messages.new([messages],nil, 0)
      expect(message.get_message("two")).to eq("2")
    end
  end
end
