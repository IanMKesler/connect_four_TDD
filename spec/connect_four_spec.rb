require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/main'

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

describe Player do
    describe '.flip_turn' do
        it 'changes turn from false to true' do
            player = Player.new('X')
            player.flip_turn
            expect(player.turn).to eql(true)
        end

        it 'changes turn from true to false' do
            player = Player.new('X')
            player.flip_turn
            player.flip_turn
            expect(player.turn).to eql(false)
        end
    end
end

describe Game do
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
            game.stub(:gets).and_return("0\n", "4\n")
            expect(game.get_move('X')).to eql(4)
        end
    end 
end