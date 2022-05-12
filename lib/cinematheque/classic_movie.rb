require 'cinematheque/movie'

# ClassicMovie stores information about one particular film to 1945 before 1968
class ClassicMovie < Movie
  attr_reader :period, :price

  def initialize(hash)
    super
    @period = 'Classic'
    @price = 1.5
  end

  def show
    "#{@title} - #{@period} Movie, director: #{@directors}"
  end
end
