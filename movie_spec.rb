require 'rspec'
require_relative 'movie.rb'
require_relative 'movie_collection.rb'

movie_collection = MovieCollection.new
first_film = movie_collection.all.first
describe Movie do 
  it '.has_genre?' do    
  expect(first_film.has_genre?('Crime')).to eq true
  end
end