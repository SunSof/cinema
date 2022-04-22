require 'rspec'
require_relative '../lib/padder/movie'
require_relative '../lib/padder/movie_collection'

movie_collection = MovieCollection.new
first_film = movie_collection.all.first
describe 'Movie' do
  context '.has_genre?' do
    it 'return true' do
      expect(first_film.has_genre?('Crime')).to eq true
    end
  end
end
