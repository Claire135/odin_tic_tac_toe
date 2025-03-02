# frozen_string_literal: true

module Rules
  def self.check_win(player, board)
    # Flatten the board for easier index checking
    flat_board = board.board.flatten
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Horizontal
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Vertical
      [0, 4, 8], [2, 4, 6] # Diagonal
    ]

    winning_combinations.any? do |combination|
      combination.all? { |index| flat_board[index] == player.player_piece }
    end
  end

  def win_tournament?(player1, player2)
    true if player1.score == 2 || player2.score == 2
  end
end
