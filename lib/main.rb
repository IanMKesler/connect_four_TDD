require_relative 'game'

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

puts game.win?('X')
