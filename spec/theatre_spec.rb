require 'rspec'
require 'cinematheque/theatre'

describe 'Theatre' do
  before do
    @theatre = Theatre.new
  end
  context '.show' do
    it 'return the movie depending on the time' do
      expect(@theatre.show('12:00').first.class).to eq AncientMovie
      expect(@theatre.show('16:00').first.genre.include?('Comedy') || @theatre.show('16:00').first.genre.include?('Adventure')).to eq true
      expect(@theatre.show('20:00').first.genre.include?('Drama') || @theatre.show('20:00').first.genre.include?('Horror')).to eq true
    end
  end
end
