require          'test/unit'
require_relative '../lib/swiss_system'

class TestRound < Test::Unit::TestCase

  def setup
    @round = SwissSystem::Round.new
    @players = YAML.load_file("./test/data/players_data.yaml")
  end


  def test_first_round_game_shuffle_paring
    paring_array = @round.paring_player(@players, "New")

    assert_not_nil paring_array[1]

    assert_nil paring_array[3] #only 5 players (= 3 pars) in test data

    assert_nil paring_array[0][2] #only 2 players in par

    #when players number is odd method add PAUSE player to last par
    assert_match /PAUSE!!/ , paring_array[2][1].name
  end


  def test_other_then_firs_round_game_point_paring
    paring_array = @round.paring_player(@players, "Next")

    assert_equal 2, paring_array[0][0].points #paring by point
    assert_equal 2, paring_array[0][1].points #First par both have 2 points 

    assert_equal 1, paring_array[1][0].points #paring by point
    assert_equal 0, paring_array[1][1].points #0 point because duplicate oponents
  end

  def test_check_repetition_oponents
    paring_array = @round.paring_player(@players, "Next")
    
    assert_equal "player5", paring_array[1][1].name
    assert_equal "player4", paring_array[2][0].name
  end

  def test_check_repetition_pause
    paring_array = @round.paring_player(@players, "Next")

    assert_equal "player5", paring_array[1][1].name
  end
  
end
