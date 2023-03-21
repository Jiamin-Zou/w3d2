require_relative "board.rb"

class AIPlayer
    # def prompt
    #     puts "Please enter a position of the card you'd like to flip like '2,3'"
    #     pos = gets.chomp.split(',').map(&:to_i)
    # end
    def initialize
        @known_cards = Hash.new {|h, k| h[k] = []}
        @matched_cards = []
    end

    def receive_match(pos)
        @matched_cards << pos
    end

    def receive_reveal_card(pos, val)
        @known_cards[val] << pos
        => [[1,2][2,1]]
    end

    # def guess
    #     pos = [rand(size), rand(size)]
    #     if receive_reveal_card.has_value(pos)
        
    # end

end