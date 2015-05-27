class Board
  attr_accessor :game_board

  def initialize
    @game_board = ['','','','','','','','','','','','','','','','']
  end

  def move(num,letter)
    @game_board[num] = letter
  end

  def checkwin
    true
  end
end
