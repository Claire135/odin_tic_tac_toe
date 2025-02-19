class Game
    include GameLogic
  
    def initialize(player1, player2, board)
      @player1 = player1
      @player2 = player2
      @board = board
    end
  
    def play
      loop do
        puts "#{@player1.name}'s turn!"
        place_piece(@player1, @board)
        @board.display_board
        if check_win(@player1)
          puts "#{@player1.name} wins!"
          @player1.score += 1
          break
        end
        puts "#{@player2.name}'s turn! "
        place_piece(@player2, @board)
        @board.display_board
        if check_win(@player2)
          puts "#{@player2.name} wins!"
          @player2.score += 1
          break
        end
  
        if @player1.score == 3 || @player2.score == 3
          puts "Game over!"
           if @player1.score > @player2.score
             puts "#{@player1.name} wins!"
           else puts "#{@player2.name} wins!"
           end
          break
        
        end
      end
    end
  
    def check_win(player)
      # Flatten the board for easier index checking
      flat_board = @board.board.flatten
      winning_combinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], # Horizontal
        [0, 3, 6], [1, 4, 7], [2, 5, 8], # Vertical
        [0, 4, 8], [2, 4, 6] # Diagonal
      ]
  
      winning_combinations.any? do |combination|
        combination.all? { |index| flat_board[index] == player.piece_kind }
      end
    end
  end