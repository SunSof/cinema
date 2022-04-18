require_relative './movie_collection'
movie_collection = MovieCollection.new
available_genres = movie_collection.available_genres
first_film = movie_collection.all.first
begin
  first_film.has_genre?("Comedy")
rescue ArgumentError => e
  puts e.messag
end
# p movie_collection.movie_sort(:date)
# p movie_collection.movie_filter(genre: "Comedy")
# p movie_collection.movie_stats(:year)
