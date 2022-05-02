require 'rspec'
require 'cinematheque/ancient_movie'

describe 'AncientMovie' do
  context '.show' do
    before do
      @ancient_movie = AncientMovie.new({ title: 'Sisters of the Gion', year: 1936 })
    end
    it 'return old movie and year' do
      expect(@ancient_movie.show).to eq 'Sisters of the Gion - Ancient Movie (1936)'
    end
  end
end
