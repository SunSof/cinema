require 'rspec'
require_relative '../movie_collection'

describe '.movie_parese' do
  context 'given file "movie.txt"' do
    it 'return an array of movies' do
      expect((MovieCollection.new).movies_parse('movies.txt').map(&:to_s).first(3)).to eq [
        'The Shawshank Redemption - 1994 - Crime,Drama', 'The Godfather - 1972 - Crime,Drama', 'The Godfather: Part II - 1974 - Crime,Drama'
      ]
    end
  end
end

describe '.movie_sort' do
  context 'given feild :date' do
    it 'return an array of movies sorted by date' do
      expect((MovieCollection.new).movie_sort(:date).map(&:to_s).first(3)).to eq [
        'The Kid - 1921 - Comedy,Drama,Family', 'The Gold Rush - 1925 - Adventure,Comedy,Drama', 'The General - 1926 - Action,Adventure,Comedy'
      ]
    end
  end
end

describe '.movie_filter' do
  context 'given hash' do
    it 'return an array of movies filtered by key and value' do
      expect((MovieCollection.new).movie_filter(genre: 'Comedy').map(&:to_s).first(3)).to eq [
        'Life Is Beautiful - 1997 - Comedy,Drama,Romance', 'City Lights - 1931 - Comedy,Drama,Romance', 'The Intouchables - 2011 - Biography,Comedy,Drama'
      ]
    end
  end
end

describe '.movie_stats' do
  context 'given field :year' do
    it 'returning statistics, how many films are made in a year' do
      expect((MovieCollection.new).movie_stats(:year).first(3)).to eq [['1994', 5], ['1972', 1], ['1974', 2]]
    end
  end
end
describe '.available_genres' do
  context 'given all genres for each films' do
    it 'return array genres' do
      expect(MovieCollection.new.available_genres.first(3)).to eq %w[Crime Drama Action]
    end
  end
end
