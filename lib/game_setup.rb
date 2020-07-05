require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class GameSetup
  attr_reader :turn_counter

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    welcome_message
    play_game
  end

  def play_game
    @turn_counter = 1

    until game_over? == true do
      turn = Turn.new(@player1, @player2)
      p "Turn Type: #{turn.type}"
      type = turn.type
      winner = turn.winner
      # print_turn_outcome(type, winner)

      turn.pile_cards
      turn.award_spoils(winner)
      @turn_counter += 1

      print_turn_outcome(type, winner)

      #game_over?
    end
    print_game_outcome(turn)
  end

  def print_turn_outcome(type, winner)
    if type == :basic
      p "Turn #{turn_counter}: #{winner.name} won 2 cards"
    elsif type == :war
      p "Turn #{turn_counter}: WAR - #{winner.name} won 6 cards"
    else
      p "Turn #{turn_counter}: *mutually_assured_destruction* 6 cards removed from play"
    end
  end

  def game_over?
    @player1.has_lost? || @player2.has_lost? || turn_counter == 1000000
  end

  def draw?
    !@player1.has_lost? && !@player2.has_lost?
  end

  def print_game_outcome(turn)
    if draw?
      p "-----DRAW-----"
    else
      p "*** #{turn.winner.name} has won the game! ***"
    end
  end

  def welcome_message
    input = ""
    until input == "GO" do
      p "Welcome to War! (or peace) This game will be played with 52 cards."
      p "The players today are Megan and Aurora."
      p "Type 'GO' to start the game!"
      p "_________________________________"
      input = gets.chomp.upcase
    end
  end
end
