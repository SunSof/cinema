require 'date'
require 'cinematheque/movie'

# NewMovie stores information about one particular film to 2000 before 2022
class NewMovie < Movie
  attr_reader :period, :price

  def initialize(hash)
    super
    @period = 'New'
    @price = 5
  end

  def show
    date_now = Date.today.year
    date = date_now - @year.to_i
    "#{@title} - #{@period} Movie came out #{date} years ago!"
  end
end
