require_relative "board"
require_relative "card"
class Game
    def initialize
        @board = Board.new
    end

    def prompt
        @board.render
        puts "Please enter a position of the card you'd like to flip like '2,3'"
        pos = gets.chomp.split(',')
        pos.map(&:to_i)
    end

    def turn
        pos = self.prompt
        previous_guess = @board.reveal(pos)
        cur_pos = self.prompt
        current_guess = @board.reveal(cur_pos)
        @board.render
        if current_guess != previous_guess
            puts "Try again"
            sleep(2)
            @board[pos].hide
            @board[cur_pos].hide
        else 
            puts "It's a match"
        end
        system("clear")
    end

    def play
        while !@board.won?
            self.turn
        end
        puts "You won"
    end
end