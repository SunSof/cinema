require 'rspec'
# require 'cinematheque/movie_collection'

describe 'MovieCollection' do
  before do
    @movie_collection = Cinematheque::MovieCollection.new
  end
  context '.movie_parse' do 
    it 'return an array of movies' do
      expect(@movie_collection.all.map(&:to_s).first(3)).to eq [
        'The Shawshank Redemption - 1994 - Crime,Drama', 'The Godfather - 1972 - Crime,Drama', 'The Godfather: Part II - 1974 - Crime,Drama'
      ]
    end
  end

  context '.create_movie' do 
    it 'return an array of movies' do
      expect(@movie_collection.create_movie({title:"The Shawshank Redemption", year: 1994, actors:"Tim Robbins,Morgan Freeman,Bob Gunton"}).show).to eq 'The Shawshank Redemption - Modern Movie, play: Tim Robbins,Morgan Freeman,Bob Gunton'
    end
  end

  context '.movie_sort' do
    it 'return an array of movies sorted by date' do
      expect((@movie_collection).movie_sort(:date).map(&:to_s).first(3)).to eq [
        'The Kid - 1921 - Comedy,Drama,Family', 'The Gold Rush - 1925 - Adventure,Comedy,Drama', 'The General - 1926 - Action,Adventure,Comedy'
      ]
    end
  end

  context '.movie_filter' do
    it 'return an array of movies filtered by key and value' do
      expect((@movie_collection).movie_filter(genre: 'Comedy').map(&:to_s).first(3)).to eq [
        'Life Is Beautiful - 1997 - Comedy,Drama,Romance', 'City Lights - 1931 - Comedy,Drama,Romance', 'The Intouchables - 2011 - Biography,Comedy,Drama'
      ]
    end
  end

  context '.movie_stats' do
    it 'returning statistics, how many films are made in a year' do
      expect((@movie_collection).movie_stats(:year).first(3)).to eq [['1994', 5], ['1972', 1], ['1974', 2]]
    end
  end

  context '.available_genres' do
    it 'return array genres' do
      expect(@movie_collection.available_genres.first(3)).to eq %w[Crime Drama Action]
    end
  end

  context '.show' do
    before do
      Timecop.freeze(2022, 10, 5, 15, 30, 0)
    end
    it 'return title, time to start and time to over' do
      expect(@movie_collection.show.include?('Now showing:')).to eq true
    end
  end
end

