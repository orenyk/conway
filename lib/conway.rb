require "conway/version"

class Conway

  attr_accessor :board

  def initialize(board)
    @board = Board.new(board)
  end

  def new_board(rounds)
    rounds.times { @board = BoardUpdater.iterate(@board) }
  end
end

class Board

  attr_reader :height, :width, :grid

  def initialize(board_array)
    validate_board(board_array)
    @height = board_array.length
    @width = board_array.first.length
    @grid = board_array
  end

  private

  def validate_board(board)
    is_rectangular?(board)
    is_binary?(board)
  end

  def is_rectangular?(board)
    width = board.first.length
    return if board.all? { |r| r.length == width }
    raise ArgumentError, "Board must be rectangular"
  end

  def is_binary?(board)
    flat = board.flatten
    return if flat.all? { |c| (0..1).to_a.include?(c) }
    raise ArgumentError, "Board must only contain zeros and ones"
  end
end

class BoardUpdater

end
