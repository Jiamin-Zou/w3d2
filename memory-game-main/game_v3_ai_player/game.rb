require_relative "board"
require_relative "card"
require_relative "human_player"
class Game
    def initialize
        @board = Board.new
        @player = HumanPlayer.new
    end

    def turn
        @board.render
        pos = @player.prompt
        previous_guess = @board.reveal(pos)
        system("clear")
        @board.render
        cur_pos = @player.prompt
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