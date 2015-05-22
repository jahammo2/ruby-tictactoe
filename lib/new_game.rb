class NewGame
  attr_accessor :board, :hc, :cc
  def initialize
    @board = ['','','','','','','','','','','','','','','','']
    @hc = 'X'
    @cc = 'O'
  end

  def first_move
    puts "who goes first, human or computer?"

    @first = gets.chomp
    
    @first
  end

  
end
