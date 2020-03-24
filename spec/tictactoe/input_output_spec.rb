require "./lib/output_input"
require "./spec/tictactoe/fakers"

RSpec.describe Tictactoe::OutputInput do
  context "output" do
    it "should output a message passed to it" do
      io = Tictactoe::OutputInput.new
      expect { io.output("yeah") }.to output("yeah\n").to_stdout
    end
    it "should return a users input" do
      user_input = FakeStringInput.new(["yes"])
      io = Tictactoe::OutputInput.new(stdin: user_input)
      expect(io.input).to eq("yes")
    end
  end
end
