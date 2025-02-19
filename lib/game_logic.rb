module GameLogic
  def place_piece(player, board)
    loop do
      puts "Enter a number between 1 and 9 to place your piece: "
      position = gets.chomp.to_i
      
      if position < 1 || position > 9
        puts "Invalid input. Please enter a number between 1 and 9."
        next
      end

      row = (position - 1) / 3
      col = (position - 1) % 3

      if board.board[row][col] == "-"
        board.board[row][col] = player.piece_kind
        break

      else
        puts "Occupado - choose again!"
      end
    end
  end

  def board_full?
    @board.board.flatten.all? { |cell| cell != "-" }
  end
end