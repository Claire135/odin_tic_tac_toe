class Player
    attr_accessor :name, :piece_kind, :score
  
    def initialize(name, piece_kind)
      @name = name
      @piece_kind = piece_kind
      @score = 0
    end
  
    def self.create_players
      loop do
        puts "Enter player 1 name: "
        player1_name = gets.chomp
  
        puts "Enter player 2 name: "
        player2_name = gets.chomp
  
        if player1_name == player2_name
          puts "Player names must be   different. Please enter again."
        else
  
          player1 = Player.new(player1_name, "X")
          player2 = Player.new(player2_name, "O")
  
          return player1, player2  # Return the player objects
        end
      end
    end
  end