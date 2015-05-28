board = Board.new

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

  def check_four(num,param)
    four_vars(num,param)
    value = num + (param * 2) if @num1 == @num2 && @num1 == @num3 && @num4 == '-' && @num1 != '-' 
    value = num + param if @num1 == @num2 && @num1 == @num4 && @num3 == '-' && @num1 != '-' 
    value = num - param if @num1 == @num3 && @num1 == @num4 && @num2 == '-' && @num1 != '-' 
    value = num if @num2 == @num3 && @num2 == @num4 && @num1 == '-' && @num2 != '-' 
    value
  end

  def four_vars(num,param)
    @num1 = board.game_board[num]
    @num2 = board.game_board[num - param]
    @num3 = board.game_board[num + param]
    @num4 = board.game_board[num + (param * 2)]
    @array = [@num1,@num2,@num3,@num4]
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
  
  def check_three(num,param)
    four_vars(num,param)
    value = nil
    value = find_blank_spot(num,param) if (@num4== @num1 || @num4== @num2 || @num4== @num3) && @num4 == 'x' && ((@num1 == '-' && @num2 == '-') || (@num3 == '-' && @num2 == '-') || (@num1 == '-' && @num3 == '-'))
    (value = find_blank_spot(num,param) if (@num1== @num4 || @num1== @num2 || @num1== @num3) && @num1 == 'x' && ((@num4 == '-' && @num2 == '-') || (@num3 == '-' && @num2 == '-') || (@num4 == '-' && @num3 == '-'))) unless value != nil
    (value = find_blank_spot(num,param) if (@num2== @num1 || @num2== @num4 || @num2== @num3) && @num2 == 'x' && ((@num4 == '-' && @num1 == '-') || (@num3 == '-' && @num1 == '-') || (@num4 == '-' && @num3 == '-'))) unless value != nil
    (value = find_blank_spot(num,param) if (@num3== @num1 || @num3== @num4 || @num3== @num2) && @num3 == 'x' && ((@num4 == '-' && @num2 == '-') || (@num1 == '-' && @num2 == '-') || (@num4 == '-' && @num1 == '-'))) unless value != nil
    value
  end

  def find_blank_spot(num,param)
    value = nil
    [num,num - param,num + param,(num + (param * 2))].map { |x| value = x if board.game_board[x] == '-' } 
    value
  end

  def random_move
    value = nil
    (0..15).each do |i|
      value = i if board.game_board[i] == '-'
    end
    value
  end


end



