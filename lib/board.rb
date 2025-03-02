class Board

  include player_input

  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def place_piece(current_player, player_piece)
    position = place_piece_prompt(current_player, player_piece)
    index = position -1
    row = index / 3
    column = index % 3
    @board[row][column] = player_piece
  end
end