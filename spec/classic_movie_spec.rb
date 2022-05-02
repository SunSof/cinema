require 'rspec'
require 'cinematheque/classic_movie'

describe 'ClassicMovie' do
  context '.show' do
    before do
      @classic_movie = ClassicMovie.new({ title: 'Anastasia', directors: 'Anatole Litvak' })
    end
    it 'return old movie and year' do
      expect(@classic_movie.show).to eq 'Anastasia - Classic Movie, director: Anatole Litvak'
    end
  end
end
