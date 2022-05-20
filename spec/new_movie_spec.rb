require 'rspec'
require 'cinematheque/new_movie'

describe 'NewMovie' do
  context '.show' do
    before do
      @new_movie = NewMovie.new({ title: 'The witch', year: 2015 }, 5)
    end
    it 'return old movie and year' do
      expect(@new_movie.show).to eq 'The witch - New Movie came out 7 years ago!'
    end
  end
end
