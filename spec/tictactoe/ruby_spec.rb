RSpec.describe Tictactoe::Ruby do
  it "has a version number" do
    expect(Tictactoe::Ruby::VERSION).not_to be nil
  end

  it "should add 1 to 1" do
    expect(1+1).to eq(2)
  end
end
