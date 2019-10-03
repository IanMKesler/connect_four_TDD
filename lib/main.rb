require_relative 'game'

def round(game, sym)
    column = game.get_move(sym)
    while game.board.full?(column)
        puts "The column is full, please choose another."
        column = game.get_move(sym)
    end
    game.slide(column, sym)
end

def play
    game = Game.new
    puts "Welcome to Connect Four!"
    turn = 1
    sym = game.turn.sym
    until turn == 43 || (turn >=4 && game.win?(sym))
        game.board.show
        sym = game.turn.sym
        round(game, sym)
        game.flip_turn
        turn += 1
    end
    game.board.show
    game.win?(sym) ? "#{sym} is the winner!" : "Stalemate!"
end

puts play
    





