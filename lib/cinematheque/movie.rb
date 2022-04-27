require 'time'
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

  def show
    # time_new = Time.new(2022, 4, 27, 13, 20, 0)
    time_now = Time.now
    time_over = time_now + @time.to_i * 60
    time_now_str, time_over_str = [time_now, time_over].map { |t| t.strftime('%H:%M') }
    "(#{@title}) (#{time_now_str}) - (#{time_over_str})"
  end
end
