require_relative "card.rb"
SAMPLES = ('A'..'Z').to_a

class Board
    def initialize (n=4)
        @grid = Board.populate(n)
    end

    def self.populate(n) #4
        deck = SAMPLES.sample((n*n)/2)
        deck.map!{|ele| ele = Card.new(ele)}
        deck *=2
        deck = deck.shuffle.each_slice(4).to_a       
    end

    def render
        print "  "
        (0...@grid.length).each {|i| print "#{i} "}
        puts
        @grid.each_with_index do |row, i|
            print "#{i} "
            row.each do |card|
                if card.face
                    print "#{card.val} "
                else
                    print "  "
                end
            end
            puts
        end
    end

    def won?
        @grid.all? {|row| row.all?{|card| card.face}}
    end

    def guess_pos
        puts "Please enter a position of the card you'd like to flip like '2,3'"
        pos = gets.chomp.split(',')
        pos.map(&:to_i)
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        self[pos] = val
    end

    def reveal
        pos = guess_pos
        if !self[pos].face
            self[pos].reveal
            return self[pos].val
        else
            puts "That card is already revealed."
        end
    end

end