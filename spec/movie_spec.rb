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
      Timecop.freeze(2022, 10, 5, 15, 30, 0)
      @movie = Movie.new({title:'Shawshank Redemption',time: '142 min'})
    end
    it 'return title, time to start and time to over' do
      expect(@movie.show()).to eq '(Shawshank Redemption) (15:30) - (17:52)'
    end
  end
end
