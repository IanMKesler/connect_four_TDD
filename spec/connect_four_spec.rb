require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game'

describe Board do
    describe '.slide' do
        it 'slides a symbol down the column' do
            board = Board.new
            board.slide(3, 'X')
            board.slide(3, 'X')
            expect(board.show(6,3)).to eql('X')
            expect(board.show(5,3)).to eql('X')
        end
    end
    describe '.show' do
        it 'shows specific cell' do
            board = Board.new
            board.slide(1, 'X')
            expect(board.show(6,1)).to eql('X')
        end

        it 'shows entire board if no arguments given' do
            board = Board.new
            6.times do |i|
                board.slide(2, 'X')
            end
            output = ''
            6.times do
                output += "0X00000\n"
            end
            expect{board.show}.to output(output).to_stdout_from_any_process
        end
    end

    describe '.full?' do
        it 'returns false for a non-full column' do
            board = Board.new
            expect(board.full?(3)).to eql(false)
        end

        it 'returns true for a full column' do

        end
    end
end

describe Game do
    describe '.flip_turn' do
        it 'changes turn from player1 to player2' do
            game = Game.new
            game.flip_turn
            expect(game.turn).to eql(game.player2)
        end

        it 'changes turn from player2 to player1' do
            game = Game.new
            game.flip_turn
            game.flip_turn
            expect(game.turn).to eql(game.player1)
        end
    end

    describe '.valid?' do
        it 'returns true if given a number 1-7' do
            game = Game.new
            expect(game.send(:valid?, '2')).to be true
        end

        it 'returns false if given anything else' do
            game = Game.new
            expect(game.send(:valid?, '0')).to be false
        end
    end

    describe '.get_move' do
        before do
            Game.any_instance.stub(:puts)
        end
        it 'returns the inputted column' do
            game = Game.new
            game.stub(:gets){ "4\n"}
            expect(game.get_move('X')).to eql(4)
        end

        it 'asks again if given an incorrect column' do
            game = Game.new
            game.stub(:gets).and_return("10\n", "4\n")
            expect(game.get_move('X')).to eql(4)
        end
    end
    
    describe '.win?' do
        it 'returns true for four horizontal' do
            game = Game.new
            4.times do |i|
                game.slide(i+1,'X')
            end
            expect(game.win?('X')).to be true
        end

        it 'returns true for four verticle' do
            game = Game.new
            4.times do
                game.slide(1,'X')
            end
            expect(game.win?('X')).to be true
        end

        it 'returns true for four diagonal top left' do
            game = Game.new
            3.times do
                game.slide(1,'O')
            end
            2.times do
                game.slide(2,'O')
            end
            game.slide(3,'O')
            4.times do |i|
                game.slide(i+1, 'X')
            end
            expect(game.win?('X')).to be true
        end

        it 'returns false when no winner' do
            game = Game.new
            7.times do |i|
                sym = i%2 == 0 ? 'X' : 'O'
                game.slide(i+1, sym)
            end
            expect(game.win?('O')).to be false
            expect(game.win?('X')).to be false
        end
    end
end

define '#play' do
    it 'returns X is the winner when X wins' do

    end

    it 'returns O is the winner when O wins' do

    end

    it 'returns stalemate when out of spaces' do

    end
end
