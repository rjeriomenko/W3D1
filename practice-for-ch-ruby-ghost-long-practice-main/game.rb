require_relative "player"

class TheGame
    attr_reader :players, :fragment, :current_player, :previous_player

    def initialize(player_1_name=nil, player_2_name=nil)
        @dictionary = {}  
        file = File.open("dictionary.txt")
        file_data = file.readlines.map(&:chomp)
        file.close
        file_data.each { |word| @dictionary[word] = true }

        case player_1_name
        when nil
            player_1 = Player.new()
        else
            player_1 = Player.new(player_1_name)
        end
        
        case player_2_name
        when nil
            player_2 = Player.new()
        else
            player_2 = Player.new(player_2_name)
        end

        @players = [player_1, player_2]
        @current_player = @players.sample
        @previous_player = nil
        @fragment = "" 
    end

    def next_player
        @current_player = @players.reject { |ele| ele == @current_player }[0]
    end

    def valid_play?(user_input) ##1

    def take_turn(player)  ##2
        user_input = gets.chomp(player)
        valid_play?(user_input)


    def play_round ##3
        @previous_player = @current_player
        next_player
        take_turn(@current_player)
    end

end

g = TheGame.new()
# g = TheGame.new("CHUNGUS", 'CHUNGUS')
p g.players
p g.fragment
p g.current_player
p g.previous_player
g.play_round