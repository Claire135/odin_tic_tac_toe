# frozen_string_literal: true

require_relative 'player'
require_relative 'displayable'
require_relative 'player_input'
require_relative 'rules'


class PlayGame

  include Displayable
  include PlayerInput
  include Rules

  def initialize
    @player1 = Player.new("Player1", 'X')
    @player2 = Player.new("Player2", 'O')
    @board = Board.new
    @round_no = 1
    @current_player = @player1
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end
    
  def start_game
    welcome_ui(@player1, @player2)
  end

  def play_round
    until check_win(@current_player, @board) == true
      round_no_ui(@round_no)
      p "Debug current player: #{@current_player}, piece kind: #{@current_player.player_piece}"
      place_piece_prompt(@current_player, @current_player.player_piece)
      @current_player.increment_score
      switch_player
    end
  end
 
  def end_round
    end_round_ui(@player1.score, @player2.score, @current_player)
    @round_no += 1
  end

  def play_game
    start_game
    until @round_no == 3 || win_tournament?(@player1, @player2)
      play_round
      end_round
    end
    #end_tournament_ui
  end

end

game = PlayGame.new
game.play_game
