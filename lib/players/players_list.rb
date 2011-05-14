require 'yaml'
require './lib/players/player.rb'

class PlayersList
  attr_accessor :players

  def initialize
    @players = []
  end

  def add(player)
    @players << player
  end

  def delete(player_number)
    @players.delete_at(player_number)
  end

  def load_player_data
    File.open("player_data", "r+") {|file| @players = YAML.load(file) }
  end

  def save_player_data
    File.open("player_data", "w+") {|file| YAML.dump(@players, file) }
  end
end
