class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(number)
    @cards[number].rank
  end

  def high_ranking_cards
    high_ranked_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_ranked_cards << card
      end
    end
    high_ranked_cards
  end
end
