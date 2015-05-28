require 'spec_helper'
require 'board'
require 'human'
require 'computer'
require 'game'

describe Computer do
  
  board = Board.new
  human = Human.new(board)
  computer = Computer.new(board)
  game = Game.new(board, computer, human)

  before(:each) do
    board.game_board = ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-']
  end

  it "puts a computer move in the middle if the computer goes first" do
    game.first_move("computer")
    expect {computer.choice}.to change {board.game_board[5]}.from('-').to('o')
  end

  it "puts a computer move in spot 6 if the human went first and put his/her move in spot 5" do
    board.game_board[5] = 'x'
    expect(computer.smart_move).to eq(6)
  end

############## AI reactions to getting 4 in a row#############

  it "goes for 4 in a row to win or block " do
    board.game_board = ['x','x','x','-','-','-','-','-','-','-','-','-','-','-','-','-']
    expect(computer.go_for_four).to eq(3)
  end

  it "goes for 4 in a row to win or block on a different row" do
    board.game_board = ['-','-','-','-','x','-','x','x','-','-','-','-','-','-','-','-']
    expect(computer.go_for_row).to eq(5)
  end

  it "goes for 4 in a column to win or block" do
    board.game_board = ['x','-','-','-','x','-','-','-','x','-','-','-','-','-','-','-']
    expect(computer.go_for_col).to eq(12)
  end

  it "goes for 4 in a column to win or block in a different column" do
    board.game_board = ['-','-','x','-','-','-','-','-','-','-','x','-','-','-','x','-']
    expect(computer.react).to eq(6)
  end

  it "goes for 4 in a diagonal" do
    board.game_board = ['x','-','-','-','-','-','-','-','-','-','x','-','-','-','-','x']
    expect(computer.go_for_diag).to eq(5)
  end

  it "goes for 4 in a diagonal to win or block in a different diagonal" do
    board.game_board = ['-','-','-','-','-','-','x','-','-','x','-','-','x','-','-','-']
    expect(computer.go_for_four).to eq(3)
  end

############# AI reactions to preemptively blocking with just two matches in a row ################
  
  it "sees two human moves in one row and will preemptively shut off that four in a row" do
    board.game_board = ['x','-','x','-','-','-','-','-','-','-','-','-','-','-','-','-']
    expect(computer.preemptive_block).to satisfy { |x| x if (x == 1 || x == 3)}
  end

  it "sees two other human moves in one row and will preemptively shut off that four in a row" do
    board.game_board = ['-','x','x','-','-','-','-','-','-','-','-','-','-','-','-','-']
    expect(computer.preemptive_block).to satisfy { |x| x if (x == 0 || x == 3)}
  end

  it "sees two more human moves in one row and will preemptively shut off that four in a row" do
    board.game_board = ['-','-','-','-','-','-','-','-','-','x','-','x','-','-','-','-']
    expect(computer.preemptive_block).to satisfy { |x| x if (x == 8 || x == 10)}
  end

  it "sees two MORE human moves in one row and will preemptively shut off that four in a row" do
    board.game_board = ['-','-','-','-','x','-','-','x','-','-','-','-','-','-','-','-']
    expect(computer.preemptive_block).to satisfy { |x| x if (x == 5 || x == 6)}
  end

  it "sees two human moves in one column and will preemptively shut off that four in a row" do
    board.game_board = ['-','x','-','-','-','x','-','-','-','-','-','-','-','-','-','-']
    expect(computer.preemptive_block).to satisfy { |x| x if (x == 9 || x == 13)}
  end

  it "sees two more human moves in one column and will preemptively shut off that four in a row" do
    board.game_board = ['-','-','-','-','x','-','-','-','x','-','-','-','-','-','-','-']
    expect(computer.preemptive_block).to satisfy { |x| x if (x == 0 || x == 12)}
  end

  it "sees two more human moves in one diagonal and will preemptively shut off that four in a row" do
    board.game_board = ['-','-','-','x','-','-','-','-','-','x','-','-','-','-','-','-']
    expect(computer.preemptive_block).to satisfy { |x| x if (x == 6 || x == 12)}
  end

############## AI will make a random move if there is no need to strike ###############

  it "makes a random move" do
    expect(computer.random_move).to be <= 15
    expect(computer.random_move).to be >= 0
  end

########### all out testing of the board #############################

  it "responds appropriately to this board" do
    board.game_board = ['-','o','o','x','o','-','-','x','o','x','-','-','-','-','-','-']
    expect(computer.react).to satisfy { |x| x if (x == 11 || x == 15)}
  end

  it "responds appropriately to this board" do
    board.game_board = ['x','-','o','x','o','x','x','x','o','x','-','o','-','-','o','-']
    expect(computer.react).to eq(12)
  end

  it "responds appropriately to this board" do
    board.game_board = ['-','-','o','x','-','x','-','-','-','x','o','x','o','o','-','-']
    expect(computer.react).to satisfy { |x| x if (x == 1 || x == 7 || x == 13 || x == 15)}

  end
  
end
