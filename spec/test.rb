require 'spec_helper'
require 'board'
require 'spec_computer'
require 'spec_human'
require 'human'
require 'computer'
require 'game'

describe Game do
  
  board = Board.new
  human = Human.new(board)
  computer = Computer.new(board)
  game = Game.new(board, computer, human)

  it "will choose human if nil" do
    expect(game.choose_first).to eq('human')
  end
  
  it "will choose who goes first" do
    game.first_move('human')
    expect(game.first_person).to eq('human')
  end

  it "will know how many moves have been made" do
    board.game_board = ['x','o','o','-','-','-','-','-','-','-','-','-','-','-','-','-']
    expect(board.check_move_amount).to eq(3)
  end
  
  # it "will call correct_human_move method if the spot is already taken or doesn't exist" do
  #   board.game_board = ['-','-','x','-','-','-','-','-','-','-','-','-','-','-','-','-']
  #   expect(game.human_move(2)).to receive(:correct_human_move)
  # end

  describe Board do
    before(:each) do
      board.game_board = ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-']
    end

    it "should be a blank board" do
      expect(board.game_board).to eq(['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-'])
    end

    it "puts an x or o in a spot" do
      expect {board.move(2,'x')}.to change {board.game_board[2]}.from('-').to('x')
    end

    it "reports a win if there are 4 O's in a row" do
      board.game_board = ['o','o','o','o','-','-','-','-','-','-','-','-','-','-','-','-']
      expect(board.check_win).to eq(true)
    end

    it "reports a win if there are 4 O's in a different row" do
      board.game_board = ['-','-','-','-','o','o','o','o','-','-','-','-','-','-','-','-']
      expect(board.check_win).to eq(true)
    end

    it "reports a win if there are 4 O's in a column" do
      board.game_board = ['o','-','-','-','o','-','-','-','o','-','-','-','o','-','-','-']
      expect(board.check_win).to eq(true)
    end

    it "reports a win if there are 4 O's in a different column" do
      board.game_board = ['-','o','-','-','-','o','-','-','-','o','-','-','-','o','-','-']
      expect(board.check_win).to eq(true)
    end

    it "reports a win if there are 4 O's in a diagonal" do
      board.game_board = ['o','-','-','-','-','o','-','-','-','-','o','-','-','-','-','o']
      expect(board.check_win).to eq(true)
    end

    it "ends in a cat scan if all possible moves are madeand there are not 4 in a row." do
      board.game_board = ['o','o','x','x','x','x','o','o','o','o','x','x','x','x','o','o']
      expect(board.check_cat_scan).to eq(true)
    end

    it "does not end in a cat scan if all possible moves have not been made and there are not 4 in a row." do
      board.game_board = ['o','o','x','x','x','x','o','o','o','o','x','x','x','-','o','o']
      expect(board.check_cat_scan).to eq(false)
    end
    # it "should be have human as X, computer as O" do
    #   new_game = NewGame.new
    #   expect(new_game.hc).to eq('X')
    #   expect(new_game.cc).to eq('O')
    # end
    #
    # it "should return who goes first" do
    #   new_game = NewGame.new
    #   expect(new_game.first_move('human')).to satisfy { |x| ['human','computer'].include?(x) }
    # end

  end

  # describe GameMoves do
  #
  #   def cter 
  #     new_game = NewGame.new
  #     counts = 0
  #     new_game.board.each { |x| counts += 1 if x = 'X' || 'O' }
  #     counts
  #   end
  #   
  #   it "places a move in the spot it chose" do
  #     counts = counter
  #     GameMoves.place_move(2)
  #     expect(counter).to eq(counts + 1)
  #     # expect(GameMoves).to be_kind_of(Game)
  #   end
  #
  # end
  #
end 
