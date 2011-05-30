module SwissSystem
  class PlayersList

    PLAYER_DATA_FILE = File.expand_path("../../../data/players_data.yaml", __FILE__)

    attr_accessor :players

    def initialize
      @players = []
    end

    def add(player)
      @players << player
    end

    def delete(player_name)
      @players.each_index do |index|
        if @players[index].name == player_name
          @players.delete_at(index)
        end
      end
    end
    
    def add_result(player1_name, point1, player2_name, point2)
      @players.each_index do |index|
        if @players[index].name == player1_name
          @players[index].points += point1.to_i
        elsif @players[index].name == player2_name
          @players[index].points += point2.to_i
        end
      end
    end

    def load_players_data(data_file = PLAYER_DATA_FILE)
      @players = YAML.load_file(data_file)
      @players = [] if @players == false
    end

    def save_players_data(data_file = PLAYER_DATA_FILE)
      File.open(data_file, "w") {|file| YAML.dump(@players, file) }
    end
  end
end
