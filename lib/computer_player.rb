class ComputerPlayer
  attr_reader :name, :board, :winner
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    moves = []
    (0..(board.grid.size - 1)).each do |row|
      (0..(board.grid.size - 1)).each do |column|
        position = [row, column]
        moves << position if board[position].nil?
      end
    end

    moves.each do |move|
      return move if win?(move)
    end

    moves.sample
  end

  def win?(move)
    board[move] = mark
    if board.winner == mark
      board[move] = nil
      return true
    else
      board[move] = nil
      return false
    end

  end

end
