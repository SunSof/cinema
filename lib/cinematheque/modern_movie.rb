require 'cinematheque/movie'

# ModernMovie stores information about one particular film to 1968 before 2000
class ModernMovie < Movie
  attr_reader :period, :price

  def initialize(hash)
    super
    @period = 'Modern'
    @price = 3
  end

  def show
    "#{@title} - #{@period} Movie, play: #{@actors}"
  end
end
