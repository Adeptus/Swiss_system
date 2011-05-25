require_relative 'player.rb'

class Round

  def paring_player(players_array, round_number = 1)
    return shuffle_paring(players_array) if round_number == 1
		point_paring(players_array)
  end

private

  def shuffle_paring(players_array)
		output_array = paring_players(players_array.shuffle)

    output_array << [players_array[0], Player.new("PAUSE!!")] unless players_array[0].nil?
  end

	def point_paring(players_array)
    players_array.sort_by! {|player| player.points}

		output_array = paring_players(players_array.reverse)

    output_array << [players_array[0], Player.new("PAUSE!!")] unless players_array[0].nil?
	end

	def paring_players(players_array)
    output_array = []
    pars = players_array.count / 2
    pars.times do
      output_array << players_array.take(2)
      players_array.slice!(0,2)
    end
		output_array
	end
end
