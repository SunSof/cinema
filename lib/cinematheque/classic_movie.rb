require 'cinematheque/movie'

# ClassicMovie stores information about one particular film to 1945 before 1968
class ClassicMovie < Movie
  def show
    "#{@title} - Classic Movie, director: #{@directors}"
  end
end
