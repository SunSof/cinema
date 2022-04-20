require 'rspec'
require_relative '../movie'
require_relative '../movie_collection'

movie_collection = MovieCollection.new
first_film = movie_collection.all.first
describe '.has_genre?' do
  context 'given genre Crime' do
    it 'return true' do
      expect(first_film.has_genre?('Crime')).to eq true
    end
  end
end
