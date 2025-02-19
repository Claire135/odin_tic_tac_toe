class Player
    attr_accessor :name, :piece_kind, :score
  
    def initialize(name, piece_kind)
      @name = name
      @piece_kind = piece_kind
      @score = 0
    end
  
    def self.create(name, piece_kind)
      Player.new(name, piece_kind)
    end
end