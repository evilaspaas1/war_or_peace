require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"
require "pry"

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, "queen", 12)
    @card2 = Card.new(:spade, "3", 3)
    @card3 = Card.new(:heart, "Ace", 14)
    cards = [@card1, @card2, @card3]
    @deck = Deck.new(cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_rank_of_card_at
    assert_equal 12, @deck.rank_of_card_at(0)
    p "Rank of card at 0: " + @deck.rank_of_card_at(0).to_s
  end

  def test_high_ranking_cards
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end
end
