# Movie stores information about one particular film
class Movie
  attr_reader :links, :title, :year, :country, :date, :genre, :time, :rating, :directors, :actors

  def initialize(hash)
    @links = hash[:links]
    @title = hash[:title]
    @year = hash[:year]
    @country = hash[:country]
    @date = hash[:date]
    @genre = hash[:genre]
    @time = hash[:time]
    @rating = hash[:rating]
    @directors = hash[:directors]
    @actors = hash[:actors]
  end

  def to_s
    "#{@title} - #{@year} - #{@genre}"
  end

  # 5.3.2 # 5.5.1
  def genre?(field, available_genres = %w[Comedy Crime Art])
    return raise ArgumentError, 'Genre does not exist' if available_genres.include?(field) == false

    @genre.include?(field)
  end
end
