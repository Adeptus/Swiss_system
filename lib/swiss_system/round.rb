module SwissSystem
	class Round

		def paring_player(players_array, round)
		  return shuffle_paring(players_array) if round == "New"
		  return points_paring(players_array)if round == "Next" 
		end

	private

		def shuffle_paring(players_array)
		  output_array, players_array = paring_players(players_array.shuffle)

		  output_array << [players_array[0], Player.new("PAUSE!!")] unless players_array[0].nil?
		  
		  output_array
		end

		def points_paring(players_array)
		  players_array.sort_by! {|player| player.points}

		  output_array, players_array = paring_players(players_array.reverse)

			unless players_array[0].nil?
		  	output_array << [players_array[0], Player.new("PAUSE!!")]
		  end

		  output_array
		end

		def paring_players(players_array)
		  output_array = []
		  pars = players_array.count / 2
		  pars.times do
		    output_array << players_array.take(2)
		    players_array.slice!(0,2)
		  end
		  return output_array, players_array
		end
	end
end
