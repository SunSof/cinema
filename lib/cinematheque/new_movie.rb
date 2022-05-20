require 'cinematheque/movie'
require 'date'

# NewMovie stores information about one particular film to 2000 before 2022
class NewMovie < Movie
  def show
    date_now = Date.today.year
    date = date_now - @year.to_i
    "#{@title} - New Movie came out #{date} years ago!"
  end
end
