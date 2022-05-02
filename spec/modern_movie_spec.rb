require 'rspec'
require 'cinematheque/modern_movie'

describe 'ModernMovie' do
  context '.show' do
    before do
      @modern_movie = ModernMovie.new({ title: 'Eyes Wide Shut', actors: 'Tom Cruise, Nicole Kidman, Madison Eginton' })
    end
    it 'return old movie and year' do
      expect(@modern_movie.show).to eq 'Eyes Wide Shut - Modern Movie, play: Tom Cruise, Nicole Kidman, Madison Eginton'
    end
  end
end
