require_relative './movie_collection'
movie_collection = MovieCollection.new
first_film = movie_collection.all.first
begin
  first_film.has_genre?('Comedy')
rescue ArgumentError => e
  puts e.message
end
 
