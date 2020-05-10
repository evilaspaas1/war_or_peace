require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "pry"

class TurnTest < Minitest::Test
  attr_reader :deck1, :deck2
  def setup
    @card1 = Card.new(:heart, "Jack", 11)
    @card2 = Card.new(:heart, "10", 10)
    @card3 = Card.new(:heart, "9", 9)
    @card4 = Card.new(:diamond, "Jack", 11)
    @card5 = Card.new(:heart, "8", 8)
    @card6 = Card.new(:diamond, "Queen", 12)
    @card7 = Card.new(:heart, "3", 3)
    @card8 = Card.new(:diamond, "2", 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_player1_has_name_and_deck

    assert_equal @player1, @turn.player1
  end

  def test_player2_has_name_and_deck

    assert_equal @player2, @turn.player2
  end

  def test_spoils_of_war
    assert_equal [], @turn.spoils_of_war
  end

  def test_type_of_turn
    assert_equal :basic, @turn.type
  end

  def test_winner
    assert_equal @player1, @turn.winner
  end

  def test_pile_cards
    assert_equal [@card1, @card3], @turn.pile_cards
  end

  def test_award_spoils
    @turn.pile_cards
    assert_equal [@card1, @card3], @turn.award_spoils
  end
end
