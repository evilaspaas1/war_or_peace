require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Meagan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_attributes
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
    assert_equal [], @turn.spoils_of_war
  end

  def test_it_can_get_turn_type
    assert_equal :basic, @turn.type
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    assert_equal :war, @turn.type
  end

  def test_it_can_show_the_winner
    assert_equal @player1, @turn.winner
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    assert_equal @player2, @turn.winner
  end

  def test_it_can_pile_cards
    @turn.pile_cards
    assert_equal [@card1, @card3], @turn.spoils_of_war
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    expected = [@card1, @card2, @card5, @card4, @card3, @card6]
    @turn.pile_cards
    assert_equal expected, @turn.spoils_of_war
  end

  def test_it_can_award_spoils
    @turn.pile_cards
    @turn.award_spoils(@player1)
    assert_equal 5, @player1.deck.cards.flatten.count
    assert_equal 3, @player2.deck.cards.flatten.count
  end
end
