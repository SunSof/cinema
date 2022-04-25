require 'rspec'
require 'cinematheque/movie'
require 'cinematheque/movie_collection'

movie_collection = Cinematheque::MovieCollection.new
first_film = movie_collection.all.first
describe 'Movie' do
  context '.genre?' do
    it 'return true' do
      expect(first_film.genre?('Crime')).to eq true
    end
  end
end
