require 'rspec'
require 'cinematheque/movie_collection'

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
    it "create ancient movie" do
      movie = @movie_collection.create_movie({year: 1931})
      expect(movie).to be_kind_of(AncientMovie)
      expect(movie.price).to eq 1
    end

    it "create classic movie" do
      movie = @movie_collection.create_movie({year: 1956})
      expect(movie).to be_kind_of(ClassicMovie)
      expect(movie.price).to eq 1.5
    end

    it "create modern movie" do
      movie = @movie_collection.create_movie({year: 1996})
      expect(movie).to be_kind_of(ModernMovie)
      expect(movie.price).to eq 3
    end

    it "create new movie" do
      movie = @movie_collection.create_movie({year: 2010})
      expect(movie).to be_kind_of(NewMovie)
      expect(movie.price).to eq 5
    end
  end

  context '.movie_sort' do
    it 'return an array of movies sorted by date' do
      expect(@movie_collection.movie_sort(:date).map(&:to_s).first(3)).to eq [
        'The Kid - 1921 - Comedy,Drama,Family', 'The Gold Rush - 1925 - Adventure,Comedy,Drama', 'The General - 1926 - Action,Adventure,Comedy'
      ]
      expect{@movie_collection.movie_sort(:name)}.to raise_exception('Wrong argument')
    end
  end

  context '.movie_filter' do
    it 'return an array of movies filtered by key and value' do
      expect(@movie_collection.movie_filter(genre: 'Comedy').map(&:to_s).first(3)).to eq [
        'Life Is Beautiful - 1997 - Comedy,Drama,Romance', 'City Lights - 1931 - Comedy,Drama,Romance', 'The Intouchables - 2011 - Biography,Comedy,Drama'
      ]
      expect{@movie_collection.movie_filter(name:'Abc')}.to raise_exception('Wrong argument')
    end
  end

  context '.movie_stats' do
    it 'returning statistics, how many films are made in a year' do
      expect(@movie_collection.movie_stats(:year).first(3)).to eq [['1994', 5], ['1972', 1], ['1974', 2]]
      expect{@movie_collection.movie_stats(:name)}.to raise_exception('Wrong argument')
    end
  end

  context '.available_genres' do
    it 'return array genres' do
      expect(@movie_collection.available_genres.first(3)).to eq %w[Crime Drama Action]
    end
  end

  context '.show' do
    it 'return title and period movie' do
      expect(@movie_collection.show.class).to eq String
    end
  end
end

