require 'rspec'
require 'cinematheque/netflix'

describe 'Netflix' do
  context '.show' do
    before do
      @movie = Netflix.new({ title: 'Shawshank Redemption', time: '142 min' })
    end
    it 'return title, time to start and time to over' do
      expect(@movie.show).to eq '(Shawshank Redemption) (13:20) - (15:42)'
    end
  end
end
