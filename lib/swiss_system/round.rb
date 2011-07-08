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
      pars_combination = players_array.combination(2).to_a.find_all {|par|
                                       !par[0].oponents.include?(par[1].name)
                                       }
      if pars_combination.empty?
        output_array << players_array.slice!(0,2)
      else
        output_array << pars_combination[0]
        pars_combination[0].each {|player| players_array.delete(player)}
      end
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
