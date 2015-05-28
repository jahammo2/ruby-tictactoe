require_relative 'board'
require_relative 'computer'
require_relative 'human'
require_relative 'game'

board = Board.new
computer = Computer.new(board)
human = Human.new(board)
game = Game.new(board, computer, human)


game.start
