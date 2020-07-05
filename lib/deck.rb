class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if @cards[index].nil?
      0
    else
      @cards[index].rank
    end
  end

  def high_ranking_cards
    high_ranked_cards = []
    @cards.each do |card|
      if card.rank >= 10
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

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
