class Human
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def place_move(num)
    board.move(num,'x')
  end

  def check_move_avail(num)
    board.game_board[num] == '-' ? true : false
  end

end
