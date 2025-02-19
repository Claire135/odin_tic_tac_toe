class Game
    include GameLogic
  
    def initialize
      @board = Board.new

      loop do
        @player1 = create_player("X")
        @player2 = create_player("O")
    
        if @player1.name == @player2.name
          puts "Player names must be different. Please enter again."
        else
          break
        end
      end
    end

    def create_player(piece_kind)
      loop do
        puts "Enter name for player 1 (#{piece_kind}'s): "
        name = gets.chomp.strip
  
        return Player.create(name, piece_kind)
      end
    end
  
    def play
      loop do
        [@player1, @player2].each do |player|
          puts "#{player.name}'s turn!"
          place_piece(player, @board)
          @board.display_board
    
          if check_win(player)
            puts "#{player.name} wins!"
            player.score += 1
            puts "#{@player1.name}'s score: #{@player1.score}, #{@player2.name}'s score: #{@player2.score}"
    
            if end_game
              return  # Stop game loop
            else
              reset_board
              return
            end
          elsif board_full?
            puts "It's a draw! You both played a terrible game."
            reset_board
            return
          end
        end
      end
    end

    def reset_board
      puts "Winner is first to reach 3!"
      @board = Board.new
      play
    end

    def end_game
        if @player1.score == 3 || @player2.score == 3
          puts "Game over!"
          if @player1.score > @player2.score
            puts "#{@player1.name} is the ultimate winner!"
          else puts "#{@player2.name} is the ultimate winner!"   
          end  
          return true  # This ensures the loop stops
        end
        false  # The game continues
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