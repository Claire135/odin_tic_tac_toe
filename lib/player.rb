class Player
  attr_accessor :score
  attr_reader :name, :player_piece

  def initialize(name, player_piece)
    @name = name
    @player_piece = player_piece
    @score = 0
  end

  def increment_score
    @score += 1
  end
end

