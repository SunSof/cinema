require 'cinematheque/movie'

# ModernMovie stores information about one particular film to 1968 before 2000
class ModernMovie < Movie
  def initialize(hash)
    super
    @period = 'Modern'
  end

  def show
    "#{@title} - #{@period} Movie, play: #{@actors}"
  end
end
