require 'csv'
require 'cinematheque/ancient_movie'
require 'cinematheque/classic_movie'
require 'cinematheque/modern_movie'
require 'cinematheque/new_movie'
module Cinematheque
  # MovieCollection parses file to array of Movie objects and keep it
  class MovieCollection
    attr_accessor :colection

    include Enumerable
    # if nil then assign value
    def periods
      @periods ||= {
        ancient: { class_name: AncientMovie, years: 1900..1945, price: 1 },
        classic: { class_name: ClassicMovie, years: 1945...1968, price: 1.5 },
        modern: { class_name: ModernMovie, years: 1968...2000, price: 3 },
        new: { class_name: NewMovie, years: 2000..2022, price: 5 }
      }
    end

    def movies_parse(file_name)
      hash_keys = %w[links title year country date genre time rating directors actors]
      CSV.parse(File.read(file_name), col_sep: '|', headers: hash_keys).map do |el|
        # make symbol
        hash = el.to_h.transform_keys(&:to_sym)
        create_movie(hash)
      end
    end

    def initialize
      # Converts a pathname to an absolute pathname.
      # First arg file name,
      # second arg __dir__ or __FILE__ - Returns the absolute path of the dir, file from which this method is called.
      file_path = File.expand_path('./data/movies.txt')
      @collection = movies_parse(file_path)
    end

    def all
      @collection
    end

    def each
      for movie in @collection do
        yield movie
      end
    end

    def map
      array = []
      for movie in @collection do
        film = yield movie
        array << film
      end
      array
    end

    def select
      array = []
      for movie in @collection do
        film = yield movie
        array << movie if film == true
      end
      array
    end

    def reject
      array = []
      for movie in @collection do
        film = yield movie
        array << movie if film == false
      end
      array
    end

    # guard clauses
    # (&field)
    def movie_sort(field)
      return raise('Wrong argument') unless all[0].respond_to?(field)

      all().sort_by { |el| el.send(field) }
    end

    def movie_filter(field)
      key = field.keys[0]
      value = field.values[0]
      return raise('Wrong argument') unless all[0].respond_to?(key)

      all().filter { |el| el.send(key).include?(value) }
    end

    def movie_stats(field)
      return raise('Wrong argument') unless all[0].respond_to?(field)

      all().each_with_object(Hash.new(0)) do |el, acc|
        str_value = el.send(field)
        acc[str_value] += 1
      end
    end

    def available_genres
      all().map(&:genre).join(',').split(',').uniq
    end

    def show
      random_movie = all().sample
      random_movie.show()
    end

    def create_movie(hash)
      year = hash[:year].to_i
      per = periods().values.find do |period|
        period[:years].include?(year)
      end
      period_class = per[:class_name]
      period_price = per[:price]
      period_class.new(hash, period_price)
    end
  end
end
