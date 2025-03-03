# frozen_string_literal: true

# Manages logic behind game play

module Rules
  def check_win(player, board)
    flat_board = board.flatten.map { |cell| cell.is_a?(String) ? cell.uncolorize : cell } # Strip colorization
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

  def end_tournament(player1, player2)
    end_tournament_ui

    if player1.score == player2.score
      puts "You both fought hard, but nobody's a winner today."
    else
      winner = player1.score > player2.score ? player1 : player2
      puts "#{winner.name} is the ultimate winner!"
    end
  end
end
