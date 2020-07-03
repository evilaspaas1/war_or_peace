class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank &&
      @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      :basic
    else @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war
    end
  end

  def winner
    if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
      @player1
    elsif @player1.deck.cards[0].rank < @player2.deck.cards[0].rank
      @player2
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
      @player1
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank < @player2.deck.cards[2].rank
      @player2
    end
  end

  def pile_cards
    if type == :war
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war
  end
end
