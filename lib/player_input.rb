# frozen_string_literal: true

# This module handles all UI and processes that require player input.
# It also handles the errors assoicated with said input.

module PlayerInput
  def place_piece_prompt(current_player)
    loop do
      puts "#{current_player.name}, pick a number between 1 - 9 to place your #{current_player.player_piece}."
      input = gets.chomp.to_i
      return input if (1..9).include?(input)
      raise StandardError, 'Please enter either a number between 1 and 9.' unless (1..9).include?(input)

      break
    rescue StandardError => e
      puts e.message
      retry
    end
  end

  def play_again_prompt
    puts 'Do you want to play again? (y/n)'
    input = gets.chomp.downcase
    if input == 'y'
      GameLauncher.start
    else
      puts 'Thanks for playing!'
      exit
    end
  end
end
