require 'spec_helper'
require 'game'
require 'board'

describe Game do
  
  game = Game.new

  board = Board.new

  it "will choose human if nil" do
    expect(game.choose_first).to eq('human')
  end
  
  it "will choose who goes first" do
    game.first_move('human')
    expect(game.first_person).to eq('human')
  end

  describe Board do
    it "should be a blank board" do
      expect(board.game_board).to eq(['','','','','','','','','','','','','','','',''])
    end

    it "puts an x or o in a spot" do
      expect {board.move(2,'x')}.to change {board.game_board[2]}.from('').to('x')
    end

    it "reports a win if there are 4 O's in a row" do
      board.game_board = ['o','o','o','o','','','','','','','','','','','','']
      expect(board.checkwin).to eq(true)
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
  #   def counter 
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
