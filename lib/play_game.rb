# frozen_string_literal: true

# Handles game flow

require_relative 'player'
require_relative 'board'
require_relative 'game_launcher'
require_relative 'rules'
require_relative 'displayable'
require_relative 'player_input'

class PlayGame
  include Displayable
  include PlayerInput
  include Rules

  def initialize
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @board = Board.new
    @round_no = 1
    @current_player = @player1
  end

  def play_game
    start_game
    play_round until @round_no == 4 || win_tournament?(@player1, @player2)
    end_tournament(@player1, @player2)
    play_again_prompt
  end

  private

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def start_game
    welcome_ui(@player1, @player2)
  end

  def play_round
    round_no_ui(@round_no)
    loop do
      position = place_piece_prompt(@current_player).to_i
      @board.place_piece(position, @current_player)
      @board.display_board

      # Check win before switching players
      break if game_won_or_tied?

      switch_player
    end
  end

  def game_won_or_tied?
    if check_win(@current_player, @board.board)
      handle_win
      true
    elsif @board.board_full?
      handle_tie
      true
    else
      false
    end
  end

  def handle_win
    @current_player.increment_score
    win_round_ui(@current_player)
    end_round_ui(@player1, @player2)
    end_round
  end

  def handle_tie
    tied_players_ui
    end_round_ui(@player1, @player2)
    end_round
  end

  def end_round
    @board.clear_board # Reset the board for the next round
    @round_no += 1     # Move to the next round
  end
end
