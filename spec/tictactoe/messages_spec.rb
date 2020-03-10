require "./lib/tictactoe/messages"
RSpec.describe Tictactoe::Messages do
  context "#get_message" do
    it "should raise an error if message key is invalid" do
        message = Tictactoe::Messages.new({"one"=>"1"})
        expect(message.get_message("two")).to eq(nil)
      end
    it "should return a message from a specific hash list" do
        message = Tictactoe::Messages.new({"one"=>"1", "two"=>"2"})
        expect(message.get_message("two")).to eq("2")
      end

  end
end
