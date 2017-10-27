require "spec_helper"

RSpec.describe Conway do
  it "has a version number" do
    expect(Conway1::VERSION).not_to be nil
  end

  it "transforms the board correctly" do
    board = [[0, 1, 0],[1, 0, 0],[0, 1,0]]
    game = Conway.new(board)
    expected = [[0,0,0],[1,1,0],[0,0,0]]
    expect(game.new_board(1)).to eq expected
  end

  describe "#new_board" do
    it "calls BoardUpdater#iterate the right number of times" do
      board = [[0]]
      game = Conway.new(board)
      allow(BoardUpdater).to receive(:iterate)
      game.new_board(1)
      expect(BoardUpdater).to have_received(:iterate).exactly(1).times
    end
  end
end

RSpec.describe Board do
  describe "#initialize" do
    it "properly sets width" do
      board_array = [[1,1],[0,0]]
      board = described_class.new(board_array)
      expect(board.width).to eq(2)
    end

    it "properly sets height" do
      board_array = [[1,1],[0,0],[0,1]]
      board = described_class.new(board_array)
      expect(board.height).to eq(3)
    end

    it "properly sets grid" do
      board_array = [[0]]
      board = described_class.new(board_array)
      expect(board.grid).to eq(board_array)
    end

    it "rejects non-rectangular arrays" do
      board_array = [[0,0],[0,1,1]]
      expect{ described_class.new(board_array) }.to raise_error(ArgumentError)
    end

    it "rejects cells not zeros or ones" do
      board_array = [[2]]
      expect{ described_class.new(board_array) }.to raise_error(ArgumentError)
    end
  end

  describe "#neighbors" do
    xit "returns an array of neighbors"
  end
end

# RSpec.describe BoardUpdater do
#   describe "#iterate" do
#     it "calls BoardUpdater#update_cell the expected number of times" do
#       board = [[1, 0],[1, 1]]
#     end
#   end
# end
