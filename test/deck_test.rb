require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"
require "pry"

class DeckTest < Minitest::Test
  def setup
    card1 = Card.new(:diamond, "queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    binding.pry
  end

  def test_it_exists
    deck = Deck.new()
  end
end
