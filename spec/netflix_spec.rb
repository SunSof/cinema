require 'rspec'
require 'cinematheque/netflix'

describe 'Netflix' do
  before do
    @movie = Netflix.new
  end
  context '.show' do
    it 'return array of movie filtred to genre, period, country' do
      expect(@movie.show(genre: 'Comedy', period: 'Classic', country: 'USA').to_s.class).to eq String
    end
  end
  context 'pay' do
  it 'return balance' do
    expect(@movie.increase_balance(10)).to eq 10
    expect(@movie.decrease_balance().class).to eq Integer
    expect(@movie.balance().class).to eq Integer
  end
  end
  context '.film_price' do 
    it 'return price' do 
      expect(@movie.film_price().class).to eq Integer
    end
  end
end
