board = Board.new
require './lib/pair'

class Computer
  attr_reader :board
  attr_accessor :num1, :num2, :num3, :num4
  
  def initialize(board)
    @board = board
  end

  def choice
    num = react
    board.move(num,'o')
    num
  end

  def react
    smart_move || go_for_four || preemptive_block || random_move
  end

  def smart_move
    case board.check_move_amount
    when 0 then 5
    when 1
      board.game_board[5] == '-' ? 5 : 6
    else
      nil
    end
  end

  def go_for_four
    go_for_row || go_for_col || go_for_diag
  end

  def go_for_row
    check_four(1,1) || check_four(5,1) || check_four(9,1) || check_four(13,1)
  end

  def go_for_col
    check_four(4,4) || check_four(5,4) || check_four(6,4) || check_four(7,4)
  end

  def go_for_diag
    check_four(6,3) || check_four(5,5)
  end

  def check_three(num,param)
    Pair.new(num,param,board).check_three
  end

  def check_four(num,param)
    Pair.new(num,param,board).check_four
  end

  def preemptive_block
    block_row || block_col || block_diag
  end

  def block_row
    check_three(1,1) || check_three(5,1) || check_three(9,1) || check_three(13,1)
  end

  def block_col
    check_three(4,4) || check_three(5,4) || check_three(6,4) || check_three(7,4)
  end

  def block_diag
    check_three(6,3) || check_three(5,5)
  end

  def random_move
    value = nil
    (0..15).each do |i|
      value = i if board.game_board[i] == '-'
    end
    value
  end


end



