class Board
  attr_accessor :game_board, :num1, :num2, :num3, :num4

  def initialize
    @game_board = ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-']
  end

  def move(num,letter)
    @game_board[num] = letter
  end

  def check_win
    check_row || check_col || check_diag
  end

  def check_cat_scan
    counter = 0
    @game_board.each { |x| (counter += 1) if (x == 'x' || x == 'o') }
    (!check_win && counter == 16) ? true : false
  end

  def check_row
    check_three(1,1) || check_three(5,1) || check_three(9,1) || check_three(13,1)
  end

  def check_col
    check_three(4,4) || check_three(5,4) || check_three(6,4) || check_three(7,4)
  end

  def check_diag
    check_three(6,3) || check_three(5,5)
  end

  def check_three(num,param)
    check_three_vars(num,param)
    (@num1 == @num2 && @num1 == @num3 && @num1 == @num4) && (@num1 != '-') ? true : false 
  end

  def check_three_vars(num,param)
    @num1 = @game_board[num]
    @num2 = @game_board[num - param]
    @num3 = @game_board[num + param]
    @num4 = @game_board[num + (param *2)]
  end

  def empty_board
    @game_board = ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-']
  end

  def game_over
    puts "Game is over. Computer has won." if check_win
    puts "Game is over. Cat scan." if check_cat_scan
    empty_board if check_cat_scan || check_win
  end

  def check_move_amount
    counter = Hash.new 0
    @game_board.each do |x|
      counter[x] += 1
    end
    16 - counter["-"]
  end

  def print_board
    gb = @game_board
    puts gb[0] + '|' + gb[1] + '|' + gb[2] + '|' + gb[3]
    puts '_______'
    puts gb[4] + '|' + gb[5] + '|' + gb[6] + '|' + gb[7]
    puts '_______'
    puts gb[8] + '|' + gb[9] + '|' + gb[10] + '|' + gb[11]
    puts '_______'
    puts gb[12] + '|' + gb[13] + '|' + gb[14] + '|' + gb[15]
  end
end
