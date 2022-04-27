require 'rspec'
require 'timecop'
require 'cinematheque/movie'
require 'cinematheque/movie_collection'

describe 'Movie' do 
  context '.genre?' do
    before do
      @movie = Movie.new({genre: 'Crime, Comedy'})
    end
    it 'return true' do
      expect(@movie.genre?('Crime')).to eq true
    end
  end
  context '.show' do
    before do
      @movie = Movie.new({title:'Shawshank Redemption',time: '142 min'})
    end
    it 'return title, time to start and time to over' do
      expect(@movie.show()).to eq '(Shawshank Redemption) (13:20) - (15:42)'
    end
  end
end
