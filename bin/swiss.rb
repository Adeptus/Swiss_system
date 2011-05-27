#!/usr/bin/ruby

require_relative '../lib/swiss_system'

Shoes.app :title => "Swiss system", :width => 800, :height => 400, :resizable => false do
  background white
  background blue, :height => 40

  caption "Swiss system", :margin => 8, :stroke => white
  
  flow :margin => 0, :margin_top => 10 do
  
    stack :margin => 1, :margin_top => 11, :width => 300 do
      para "Players list", :stroke => red, :fill => yellow
  
      stack :margin_left => 5, :margin_right => 10, :width => 300, :height => 200, :scroll => true do
        background white
        border blue
        @gui_player_list = para
      end
  
      flow :margin_top => 1 do
        para "Player:"
        @add = edit_line(:margin_left => 5, :width => 180)
        button("Add", :margin_left => 5)  { add_player(@add.text); @add.text = '' }
      end
  
      flow :margin_top => 1 do
        button("New Game", :margin_left => 5, :width => 300)  { preper_round("New") }
      end
      flow :margin_top => 1 do
        button("Next Game", :margin_left => 5, :width => 300)  { preper_round("Next") }
      end
    end
    
    stack :margin => 1, :margin_top  => 10, :width => 500 do
      para "Rounds:", :stroke => red, :fill => yellow

      stack :margin_left => 5, :margin_right => 10, :width => 500, :height => 300, :scroll => true do
          background white
          border blue
          @gui_round = para
      end
    end
  end
  
  def refresh_gui_list
    @gui_player_list.replace *( 
        @players.map do |player|
         [ player.name, '    big points:' , player.points] + ['  '] +
          [ link('delete') { remove_player(player.name) } ] + 
          [ "\n" ]
      end
    )
  end
    
  def add_player(item)
    return if item == ''
  
    @players_list.add(Player.new(item))
		@players_list.save_players_data
  
    load
  end

  def remove_player(player_name)
    @players_list.delete(player_name)
		@players_list.save_players_data

    load
  end

  def preper_round(round_number)
    @round = Round.new
    paring = @round.paring_player(@players, round_number)
    refresh_round(paring)
    load
  end

  def refresh_round(paring)
  @gui_round.replace *( paring.map do |par|
      [ par[0].name ] + [ ' vs ' ] + [ par[1].name ] +
      [link("Result")  { add_result(par[0].name, par[1].name) }] +
      [ "\n" ]
    end
    )
  end
  
  def add_result(player1_name, player2_name)
    point1 = ask("Please, enter point #{player1_name}:")
    point2 = ask("Please, enter point #{player2_name}:")
    @players_list.add_result(player1_name, point1, player2_name, point2)
		@players_list.save_players_data

    load
  end

  def load
    @players_list = PlayersList.new

    @players_list.load_players_data
    @players = @players_list.players
    
    refresh_gui_list
  end
  
  load
  
end
