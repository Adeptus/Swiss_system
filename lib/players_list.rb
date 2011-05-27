require 'yaml'
require_relative 'player.rb'

class PlayersList
  attr_accessor :players

  def initialize
    @players = []
  end

  def add(player)
    @players << player
    save_players_data
  end

  def delete(player_name)
    @players.each_index do |index|
      if @players[index].name == player_name
        @players.delete_at(index)
      end
    end
    
    save_players_data
  end
  
  def add_result(player1_name, point1, player2_name, point2)
    @players.each_index do |index|
      if @players[index].name == player1_name
        @players[index].points += point1.to_i
      elsif @players[index].name == player2_name
        @players[index].points += point2.to_i
      end
    end
    
    save_players_data
  end

  def load_players_data
     File.open("./data/players_data.yaml", "r") {|file| @players = YAML.load(file) }
     @players = [] if @players == false
  end

  def save_players_data
    File.open("./data/players_data.yaml", "w") {|file| YAML.dump(@players, file) }
  end
end