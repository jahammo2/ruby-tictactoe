class Pair
  attr_accessor :num, :param, :board

  def initialize(num, param, board)
    @num = num
    @param = param
    @board = board
    four_vars
  end

  def four_vars
    @num1 = board.game_board[num]
    @num2 = board.game_board[num - param]
    @num3 = board.game_board[num + param]
    @num4 = board.game_board[num + (param * 2)]
  end


  def check_four
    value = num + (param * 2) if @num1 == @num2 && @num1 == @num3 && @num4 == '-' && @num1 != '-' 
    value = num + param if @num1 == @num2 && @num1 == @num4 && @num3 == '-' && @num1 != '-' 
    value = num - param if @num1 == @num3 && @num1 == @num4 && @num2 == '-' && @num1 != '-' 
    value = num if @num2 == @num3 && @num2 == @num4 && @num1 == '-' && @num2 != '-' 
    value
  end

  def check_case(spot, other_spots)
    any_two_spots_match = other_spots.include?(spot)
    is_other_players_spot = (spot == 'x')
    has_two_open_spots = other_spots.combination(2).find { |pair| pair.first == '-' && pair.last == '-' }
    find_blank_spot if
      any_two_spots_match &&
      is_other_players_spot &&
      has_two_open_spots
  end

  def case1
    other_spots = [@num1,@num2,@num3]
    spot = @num4
    check_case(spot, other_spots)
  end

  def case2
    other_spots = [@num4,@num2,@num3]
    spot = @num1
    check_case(spot, other_spots)
  end

  def case3
    other_spots = [@num1,@num4,@num3]
    spot = @num2
    check_case(spot, other_spots)
  end

  def case4
    other_spots = [@num1,@num2,@num4]
    spot = @num3
    check_case(spot, other_spots)
  end

  def check_three
    case1 || case2 || case3 || case4
  end

  def find_blank_spot
    value = nil
    [num,num - param,num + param,(num + (param * 2))].map { |x| value = x if board.game_board[x] == '-' } 
    value
  end

end
