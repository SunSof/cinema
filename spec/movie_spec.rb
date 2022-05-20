require 'rspec'
require 'timecop'
require 'cinematheque/movie'
require 'cinematheque/movie_collection'

describe 'Movie' do 
  context '.genre?' do
    before do
      @movie = Movie.new({genre: 'Crime, Comedy'}, 3)
    end
    it 'return true' do
      expect(@movie.genre?('Crime')).to eq true
    end
  end
end
