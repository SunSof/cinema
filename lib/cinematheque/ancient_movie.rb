require 'cinematheque/movie'

# AcientMovie stores information about one particular film before 1945
class AncientMovie < Movie
  attr_reader :period, :price

  def initialize(hash)
    super
    @period = 'Ancient'
    @price = 1
  end

  def show
    "#{@title} - #{@period} Movie (#{@year})"
  end
end
