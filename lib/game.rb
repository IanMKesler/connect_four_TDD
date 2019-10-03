class Game
    require_relative 'board'
    require_relative 'player'
    attr_accessor :board, :player1, :player2

    def initialize
        @board = Board.new
        @player1 = Player.new('X')
        @player2 = Player.new('O')
    end

    def slide(column, sym)
        @board.slide(column, sym)
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

    def win?(sym)
        row = construct_row
        column = construct_column
        left_diag = construct_left_diag
        right_diag = construct_right_diag
        
        return check(row, sym) || check(column, sym) || check(left_diag, sym) || check(right_diag, sym)
    end

    private 

    def valid?(input)
        input.match?(/[1-7]/) ? true : false
    end
    
    def check(string, sym)
        split = sym == 'X' ? 'O' : 'X'
        runs = string.split(/[#{split}0]/)
        count = runs.select {|run| run.length >= 4}
        count.empty? ? false : true 
    end

    def construct_row
        row = ''
        7.times do |i|
            row += @board.show(@board.last_position[0]+1, i+1)
        end
        row
    end

    def construct_column
        column = ''
        6.times do |i|
            column += @board.show(i+1, @board.last_position[1]+1)
        end
        column
    end

    def construct_left_diag
        r = @board.last_position[0]+1
        c = @board.last_position[1]+1
        diag = @board.show(r, c)
        5.times do |i|
            begin
                diag.prepend(@board.show(r-(i+1),c-(i+1)))
            rescue
                break
            end
        end
        5.times do |i|
            begin
                diag += @board.show(r+(i+1), c+(i+1))
            rescue
                break
            end
        end
        diag
    end

    def construct_right_diag
        r = @board.last_position[0]+1
        c = @board.last_position[1]+1
        diag = @board.show(r, c)
        5.times do |i|
            begin
                diag.prepend(@board.show(r+(i+1),c-(i+1)))
            rescue
                break
            end
        end
        5.times do |i|
            begin
                diag += @board.show(r-(i+1), c+(i+1))
            rescue
                break
            end
        end
        diag
    end
    
end