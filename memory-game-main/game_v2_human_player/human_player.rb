class HumanPlayer
    def prompt
        puts "Please enter a position of the card you'd like to flip like '2,3'"
        pos = gets.chomp.split(',').map(&:to_i)
    end
end