require "pry"

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
    #binding.pry
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      :basic
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank &&
       @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
       :mutually_assured_destruction
     elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
       :war
    end
  end


  def winner
    if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
       "No Winner"
     elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
       @player1
       binding.pry
     elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank < @player2.deck.cards[2].rank
       @player2
       # binding.pry
     elsif @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
       @player1
     else
       @player2
     end
   end

  def pile_cards
    #binding.pry
    @spoils_of_war << @player1.deck.cards.shift
    @spoils_of_war << @player2.deck.cards.shift

  end

  def award_spoils
    if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
      @player1.deck.cards << @spoils_of_war
    else
      @player2.deck.cards << @spoils_of_war
    end
    @spoils_of_war
  end
end