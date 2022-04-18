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
  def has_genre?(field, access_genre)
    if access_genre.include?(field) == false
      raise ArgumentError, 'Wrong argument'
    else
      @genre.include?(field)
    end
  end
end
