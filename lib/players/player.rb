require './data/player_date'

class Player

  attr_accessor :name, :points, :small_points

  def build
    player = Player.new
    player.name = prompt("Please write player name:")
    player.points       = 0
    player.small_points = 0

    return player
  end

  def print_player
    puts "#{name} big/small player points: #{points}/#{small_points}"
  end

private

  def prompt(text)
    puts text
    input = gets.chop
  end

end

