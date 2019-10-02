class Game
    def initialize
        @board = Board.new
        @player1 = Player.new('X')
        @player2 = Player.new('O')
    end


    def get_move(sym)
        puts "#{sym}: Which column?"
        input = gets.strip
        valid = valid?(input)
        until valid
            puts "Please input a number between 1-7"
            input = gets.strip
            valid = valid?(input)
        end
        input.to_i
    end

    private 

    def valid?(input)
        input.match?(/[1-7]/) ? true : false
    end        
end