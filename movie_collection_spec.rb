require 'rspec'
require_relative 'movie_collection'

describe MovieCollection do
  it '.movie_parese' do
    expect((MovieCollection.new).movies_parse('movies.txt').map(&:to_s).first(3)).to eq [
      'The Shawshank Redemption - 1994 - Crime,Drama', 'The Godfather - 1972 - Crime,Drama', 'The Godfather: Part II - 1974 - Crime,Drama'
    ]
  end
  it '.movie_sort' do
    expect((MovieCollection.new).movie_sort(:date).map(&:to_s).first(3)).to eq [
      'The Kid - 1921 - Comedy,Drama,Family', 'The Gold Rush - 1925 - Adventure,Comedy,Drama', 'The General - 1926 - Action,Adventure,Comedy'
    ]
  end
  it '.movie_filter' do
    expect((MovieCollection.new).movie_filter(genre: 'Comedy').map(&:to_s).first(3)).to eq [
      'Life Is Beautiful - 1997 - Comedy,Drama,Romance', 'City Lights - 1931 - Comedy,Drama,Romance', 'The Intouchables - 2011 - Biography,Comedy,Drama'
    ]
  end
  it '.movie_stats' do
    expect((MovieCollection.new).movie_stats(:year).first(3)).to eq [['1994', 5], ['1972', 1], ['1974', 2]]
  end
  it '.available_genres' do
    expect(MovieCollection.new.available_genres.first(3)).to eq %w[Crime Drama Action]
  end
end
