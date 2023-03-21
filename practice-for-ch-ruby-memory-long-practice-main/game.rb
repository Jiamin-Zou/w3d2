require_relative "board"
require_relative "card"
class Game
    def initialize
        @board = Board.new
    end

    def turn 
        pos = @board.guess_pos
        previous_guess = @board.reveal(pos)
        @board.render
        cur_pos = @board.guess_pos
        current_guess = @board.reveal(cur_pos)
        @board.render
        if current_guess != previous_guess
            sleep(2)
            puts "Try again"
            @board[pos].hide
            @board[cur_pos].hide
            @board.render
        else 
            puts "It's a match"
        end
    end

    def play
        @board.render
        while !@board.won?
            self.turn
        end
        puts "You won"
    end
end