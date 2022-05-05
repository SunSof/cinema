require 'cinematheque/movie'

# ClassicMovie stores information about one particular film to 1945 before 1968
class ClassicMovie < Movie
  attr_reader :period

  def initialize(hash)
    super
    @period = 'Classic'
  end

  def show
    "#{@title} - #{@period} Movie, director: #{@directors}"
  end
end
