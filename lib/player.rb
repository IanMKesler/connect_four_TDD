class Player
  attr_reader :turn , :sym
  
  def initialize(sym)
    @sym = sym
    @turn = false
  end

  def flip_turn
    @turn = !@turn
  end
end