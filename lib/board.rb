class Board
  def initialize
    @board = []
    7.times do
      @board << ['0', '0', '0', '0', '0', '0']
    end
  end

  def slide(c, sym)
      @board[c-1].each_with_index do |cell, index|
        if @board[c-1][index] != '0'
          @board[c-1][index-1] = sym
          return
        end
      end
      @board[c-1][@board[c-1].length-1] = sym
    end

  def show(r = nil, c = nil)
    if r && c
      @board[c-1][r-1]
    else
      @board[0].length.times { |i|
        output = '' 
        @board.each do |column|
          output += column[i]
        end
        puts output
      }
    end
  end

  def full?(c)
    @board[c-1][0] != '0' ? true : false
  end
end