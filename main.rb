require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game_logic'
require_relative 'lib/game'

player1, player2 = Player.create_players
board = Board.new
game = Game.new(player1, player2, board)

puts "Player 1: #{player1.name} is X's."
puts "Player 2: #{player2.name} is O's."

board.display_board
game.play