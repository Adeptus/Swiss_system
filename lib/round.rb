require_relative 'player.rb'

class Round

  def execute(players_array, round_number = 1)
    return shuffle_paring(players_array) if round_number == 1
  end

private

  def shuffle_paring(players_array)
    output_array = []
    players_array = players_array.shuffle
    
    pars = players_array.count / 2
    pars.times do
      output_array << players_array.take(2)
      players_array.slice!(0,2)
    end

    output_array << [players_array[0], Player.new("PAUSE!!")] unless players_array[0].nil?

    return output_array
  end
end