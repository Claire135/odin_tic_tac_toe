require_relative 'player_input'
class Board

  include PlayerInput

  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def place_piece(position, player)
    row = (position - 1) / 3
    col = (position - 1) % 3

    if @board[row][col].is_a?(Integer)
      @board[row][col] = player.player_piece
    else
      puts "Invalid move! That spot is already taken. Try again."
      return false  # Return false so the game can ask for a new input
    end
  
    true  # Return true if the move was successful
  end

  def display_board
    @board.each do |row|
      puts row.join(" | ")
    end
  end
end