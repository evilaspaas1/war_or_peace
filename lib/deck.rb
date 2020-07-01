class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
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

  def percent_high_ranking
    percentage = high_ranking_cards.length.to_f / @cards.length.to_f
    multiplied = percentage * 100
    multiplied.round(2)
  end
end
