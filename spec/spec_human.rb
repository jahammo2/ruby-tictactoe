require 'spec_helper'
require 'board'
require 'human'
require 'computer'
require 'game'

describe Human do
  board = Board.new
  human = Human.new(board)
  computer = Computer.new(board)
  game = Game.new(board, computer, human)

  it "will place an x in a spot" do
    expect {human.place_move(2)}.to change {board.game_board[2]}.from('-').to('x')
  end

  it "will not place a move is the spot is already taken" do
    board.game_board = ['-','-','x','-','-','-','-','-','-','-','-','-','-','-','-','-']
    expect(human.check_move_avail(2)).to eq(false)
  end

end

