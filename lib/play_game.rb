# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
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
      if check_win(@current_player, @board.board)
        @current_player.increment_score
        end_round_ui(@player1, @player2, @current_player)
        break
      end

      switch_player
    end
  end

  def play_game
    start_game
    play_round until @round_no == 3 || win_tournament?(@player1, @player2)
    end_tournament_ui
  end
end

game = PlayGame.new
game.play_game
