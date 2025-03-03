# frozen_string_literal: true

require_relative 'player_input'
class Board
  attr_reader :board

  include PlayerInput

  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def display_board
    @board.each do |row|
      puts row.join(' | ')
    end
    puts ''
  end

  def board_full?
    @board.flatten.none? { |cell| cell.is_a?(Integer) }
  end

  def clear_board
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def place_piece(position, player)
    row = (position - 1) / 3
    col = (position - 1) % 3
    return invalid_move_message unless valid_move?(row, col)

    @board[row][col] = colored_piece(player)
    true
  end

  private

  def valid_move?(row, col)
    @board[row][col].is_a?(Integer)
  end

  def colored_piece(player)
    color = player.player_piece == 'X' ? :green : :magenta
    player.player_piece.colorize(color)
  end

  def invalid_move_message
    puts 'Invalid move! That spot is already taken. Try again.'
    false
  end
end
