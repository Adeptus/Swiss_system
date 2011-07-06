module SwissSystem
  class Round

    def paring_player(players_array, round)
      return shuffle_paring(players_array) if round == "New"
      points_paring(players_array)
    end

  private

    def shuffle_paring(players_array)
      players_array = remove_oponents(players_array.shuffle)
      output_array = paring_players(add_pause_player(players_array))
    end

    def points_paring(players_array)
      players_array.sort! {|x, y| y.points <=> x.points}
      output_array = paring_players(add_pause_player(players_array))
    end

    def paring_players(players_array)
      output_array = []
      while !players_array.empty?
        players_array, output_array = check_repetition(players_array, output_array)
      end
      output_array
    end
    
    def check_repetition(players_array, output_array)
      index = players_array.index do |player|
        !player.oponents.include?(players_array[0].name) and 
        player.name != players_array[0].name
      end
      players_array[1], players_array[index] = players_array[index], players_array[1]
      output_array << players_array.slice!(0,2)
      return players_array, output_array
    end
    
    def remove_oponents(players_array)
      players_array.each {|player| player.oponents = []}
    end
    
    def add_pause_player(players_array)
      players_array << Player.new("PAUSE!!") if players_array.count % 2 != 0
    end
  end
end
