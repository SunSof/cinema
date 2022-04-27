require 'rspec'
require 'cinematheque/theatre'

describe 'Theatre' do
  context '.show' do
    before do
      Timecop.freeze(2022, 10, 5, 15, 30, 0)
      @movie = Theatre.new({ title: 'Shawshank Redemption', time: '142 min' })
    end
    it 'return title, time to start and time to over' do
      expect(@movie.show).to eq '(Shawshank Redemption) (15:30) - (17:52)'
    end
  end
end
