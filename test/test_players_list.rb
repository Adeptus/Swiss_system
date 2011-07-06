require          'test/unit'
require_relative '../lib/swiss_system'

class PlayersListTest < Test::Unit::TestCase

  def setup
    @players_list = SwissSystem::PlayersList.new
  end


  def test_adding_new_player_method
    @players_list.add(SwissSystem::Player.new("Adeptus"))
    
    assert_equal "Adeptus", @players_list.players[0].name
  end


  def test_delete_player_method
    @players_list.players[0] = SwissSystem::Player.new("Adeptus")

    @players_list.delete("Adeptus")

    assert_nil @players_list.players[0]
  end


  def test_add_result_method
    @players_list.players[0] = SwissSystem::Player.new("Player1")
    @players_list.players[1] = SwissSystem::Player.new("Player2")

    @players_list.add_result("Player1", 2, "Player2", 1)

    assert_equal 2, @players_list.players[0].points
    assert_equal 1, @players_list.players[1].points
  end


  def test_load_players_data_method
    @players_list.load_players_data("./test/data/players_data.yaml")

    assert_equal "player1", @players_list.players[0].name
  end


  def test_save_players_data_method
    @players_list.players[0] = SwissSystem::Player.new("TEST_PLAYER")
    @players_list.save_players_data("./test/data/TEST.yaml")

    @players_list.delete("TEST_PLAYER")

    @players_list.load_players_data("./test/data/TEST.yaml")
    assert_equal "TEST_PLAYER", @players_list.players[0].name
  
    FileUtils.remove_file("./test/data/TEST.yaml")
  end
  
  def test_players_sort
    @players_list.players[0] = SwissSystem::Player.new("Player1", 0)
    @players_list.players[1] = SwissSystem::Player.new("Player2", 2)
    @players_list.players[2] = SwissSystem::Player.new("Player3", 1)

    @players_list.sort_players
    assert_equal 2, @players_list.players[0].points
  end
  
  def test_save_repetition_oponents
    @players_list.load_players_data("./test/data/players_data.yaml")
    
    round = SwissSystem::Round.new
    @players_list.save_oponents(round.paring_player(@players_list.players, "New"))
    assert_not_equal [], @players_list.players[0].oponents
  end

end
