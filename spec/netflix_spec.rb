require 'rspec'
require 'cinematheque/netflix'

describe 'Netflix' do
  before do
    @netflix = Netflix.new()
  end
  context '.show' do
    it 'pay' do
      expect(@netflix.increase_balance(10)).to eq 10
      movie = @netflix.show({genre: 'Comedy', country: 'USA', period: :classic})
      expect(movie.price).to eq 1.5
      expect(@netflix.balance).to eq 8.5
    end
  end 
  context '.how_much?' do 
    it 'return film price or not have this film' do 
      expect(@netflix.how_much?('The Terminator')).to eq 3
    end 
  end 
end
