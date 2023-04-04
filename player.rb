class Player

  attr_reader :score, :name

  def initialize(name)
    @name = name
    @score = 3
  end 

  def loose_points
    @score -= 1
  end

end