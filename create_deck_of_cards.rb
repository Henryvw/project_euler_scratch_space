# The following is an example of how to use the #cycle method, which will cycle through an Object that has the Enumerable Module mixed in as many times as the integer that you give it. (Which can of course also be dynamic).
# The below PlayingCard::Deck example is also an example for me of how to create a dynamic list of objects in a dynamic way: a real programmer way, instead of actually writing them all down. The code of the PlayingCard and Deck class together will produce 52 cards- OR as many decks as you want.


class PlayingCard
  SUITS = %w{ clubs diamonds hearts spades }
  RANKS = %w{ 2 3 4 5 6 7 8 9 10 J Q K A }
  
  attr_reader :stacks

  class Deck
    attr_reader :cards
    def initialize(n=1)
      @cards = []
      SUITS.cycle(n) do |s|
        RANKS.cycle(1) do |r|
          @cards << "#{r} of #{s}"
        end
      end
    end
  end
end

deck = PlayingCard::Deck.new(1)

decks = PlayingCard::Deck.new(4)

# And using the amazing #each_slice I can even break these decks down into separate decks.
DECKS = []
decks.cards.each_slice(52) do |slice|
  puts "Here's A New Deck!"
  puts slice
  DECKS << slice
end

puts DECKS.inspect


# And using #inject or #reduce I can sum up the cards in the deck. Classic case is with integers but whatevs!
# Note the need to use #map here because otherwise the iteration wouldn't return a transformed / mutabilitized array of integers for the ranks variable.
ranks = PlayingCard::RANKS.map {|rank| rank.to_i}
puts ranks.each {|rank| puts rank.class }
puts injected_ranks = ranks.inject(0) {|accumulate, n| accumulate + n }
