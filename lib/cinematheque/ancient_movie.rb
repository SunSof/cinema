require 'cinematheque/movie'

# AcientMovie stores information about one particular film before 1945
class AncientMovie < Movie
  def initialize(hash)
    super
    @period = 'Ancient'
  end

  def show
    "#{@title} - #{@period} Movie (#{@year})"
  end
end
