require 'cinematheque/movie'

# AcientMovie stores information about one particular film before 1945
class AncientMovie < Movie
  def show
    "#{@title} - Ancient Movie (#{@year})"
  end
end
