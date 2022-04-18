require_relative './movie_collection'
begin
rescue ArgumentError => e
  puts e.message
end

movie_collection = MovieCollection.new
feilds = movie_collection.accesses_feilds
first_film = movie_collection.all.first
p first_film.has_genre?('Comedy', feilds)

# p movie_collection.movie_sort(:date)
# p movie_collection.movie_filter(genre: "Comedy")
# p movie_collection.movie_stats(:year)
