require 'rspec'
require 'cinematheque/netflix'

describe 'Netflix' do
  context '.show' do
    before do
      @movie = Netflix.new
    end
    it 'return array of movie filtred to genre, period, country' do
      expect(@movie.show(genre: 'Comedy', period: 'Classic', country: 'USA').map(&:to_s).first(3)).to eq [
        'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb - 1964 - Comedy,War',
        "Singin' in the Rain - 1952 - Comedy,Musical,Romance",
        'The Apartment - 1960 - Comedy,Drama,Romance'
      ]
    end
  end
end
