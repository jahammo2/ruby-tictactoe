require 'spec_helper'
require 'game'
require 'new_game'

describe Game do

  describe NewGame do
    it "should be a blank board" do
      new_game = NewGame.new
      expect(new_game.board).to eq(['','','','','','','','','','','','','','','',''])
    end

    it "should be have human as X, computer as O" do
      new_game = NewGame.new
      expect(new_game.hc).to eq('X')
      expect(new_game.cc).to eq('O')
    end

    it "should return who goes first" do
      new_game = NewGame.new
      expect(new_game.first_move).to satisfy { |x| ['human','computer'].include?(x) }
    end

  end

end 
