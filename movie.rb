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

  # 5.3.2 # 5.5.1
  def has_genre?(field, available_genres = ["Comedy", "Crime", "Art"])
    if available_genres.include?(field) == false
      raise ArgumentError, 'Genre does not exist'
    else  
      @genre.include?(field)
    end
  end
end
