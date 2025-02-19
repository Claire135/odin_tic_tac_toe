class Board
    attr_accessor :board
    
    def initialize
      @board = Array.new(3) { Array.new(3, "-") }
    end
  
    def display_board
      @board.each do|row|
        puts row.join(" | ") 
        puts "---------" 
      end
    end
end