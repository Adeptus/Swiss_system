require 'test/unit'
require_relative '../lib/round.rb'

class TestRound < Test::Unit::TestCase

  def setup
    @round = Round.new
  end

  def test_round_player
    assert_not_equal "stasiek", @round.execute(["stasiek", "ma", "la", "ko", "da"]).first
  
  end

end