class Board
    attr_accessor :board
    
    def initialize
      @board = [
        ["-", "-", "-"],
        ["-", "-", "-"],
        ["-", "-", "-"],
      ]
    end
  
    def display_board
      @board.each do|row|
        puts row.join(" | ")
        puts "---------"
      end
    end
  end