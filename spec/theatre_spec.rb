require 'rspec'
require 'cinematheque/theatre'

describe 'Theatre' do
  before do
    @theatre = Theatre.new
  end
  context '.show' do
    it 'return the movie depending on the time' do
      expect(@theatre.show('10:00').first.class).to eq AncientMovie
      expect(@theatre.show('15:00').first.genre.include?('Comedy') || @theatre.show('16:00').first.genre.include?('Adventure')).to eq true
      expect(@theatre.show('20:00').first.genre.include?('Drama') || @theatre.show('20:00').first.genre.include?('Horror')).to eq true
      expect{@theatre.show('02:00')}.to raise_exception('Theatre not working')
    end
  end

  context '.when?' do
    it 'return time' do 
      expect(@theatre.when?('Citizen Kane')).to eq '8:00 - 9:59'
      expect(@theatre.when?('North by Northwest')).to eq '12:00 - 14:16'
      expect(@theatre.when?('Once Upon a Time in America')).to eq '18:00 - 21:49'
      expect{@theatre.when?('Abc')}.to raise_exception('No film with that title')
      expect{@theatre.when?('2001: A Space Odyssey')}.to raise_exception('No filters for this film')
    end  
  end
end
