board = Board.new
human = Human.new(board)
computer = Computer.new(board)

class Game
  attr_reader :first_person, :board, :computer, :human

  def initialize(board, computer, human)
    @board = board
    @computer = computer
    @human = human
  end

  def start
    puts "human is 'X' and computer is 'O'"
    choose_first
    board.print_board
    @first_person == 'human' ? human_move : comp_move
  end

  def first_move(player)
    @first_person = player
  end

  def human_move
    board.print_board
    puts "what move would you like to make? Choose an integer from 0-15"
    spot = gets.chomp.to_i
    human.check_move_avail(spot) ? make_human_move(spot) : correct_human_move
  end

  def make_human_move(spot)
    human.place_move(spot)
    board.check_win ? board.game_over : comp_move
  end

  def correct_human_move
    puts "I'm sorry that spot was either taken or doesn't exist"
    human_move
  end

  def comp_move
    board.print_board
    computer.choice
    board.check_win ? board.game_over : human_move
  end

  def choose_first
    first = get_first || 'human'
    puts first + " goes first"
    first_move(first)
  end

  def get_first
    puts "Who goes first? Computer or human?"
    this_first = case (gets.chomp).downcase
    when "human"
      "human"
    when "computer"
      "computer"
    else
      nil
    end
  end
end

#
# - prevent overriding moves
# - need way to input move
# - need way to keep moves going
