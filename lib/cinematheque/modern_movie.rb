require 'cinematheque/movie'

# ModernMovie stores information about one particular film to 1968 before 2000
class ModernMovie < Movie
  def show
    "#{@title} - Modern Movie, play: #{@actors}"
  end
end
