# frozen_string_literal: true

module Displayable

  def display_board(board)
    board.each do |row|
      puts row.join(" | ") 
    end
  end

  def welcome_ui(player1, player2)
    puts "Welcome to X's and O's. The aim of the game is to get 3 of your pieces in a row!"
    puts "Player1 is playing as #{player1.player_piece}'s and Player2 is playing as #{player2.player_piece}'s"
  end

  def round_no_ui(round_no)
    puts "Round No: #{round_no}"
  end

  def end_round_ui(player1, player2, current_player)
    puts "#{current_player} won this round!"
    puts "#{player1.name}'s score: #{player1.score}, #{player2.name}'s score: #{player2.score}"
  end
end

include Displayable
display_board([
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
])
