require 'rspec'
require 'cinematheque/netflix'

describe 'Netflix' do
  before do
    @netflix = Netflix.new()
  end
  context '.show' do
    it 'return the film after paying for it' do
      expect(@netflix.increase_balance(10)).to eq 10
      movie = @netflix.show({genre: 'Comedy', country: 'USA', period: :classic})
      expect(movie.price).to eq 1.5
      expect(@netflix.balance).to eq 8.5
      expect{@netflix.show({country:'Japan',genre:'War',year:'1915'})}.to raise_exception('Not movies this filters')
    end
  end 
  context '.how_much?' do 
    it 'return film price or not have this film' do 
      expect(@netflix.how_much?('The Terminator')).to eq 3
      expect{@netflix.how_much?('Abc')}.to raise_exception('No movies with that name')
    end 
  end 
end
