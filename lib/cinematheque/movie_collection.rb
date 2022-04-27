require 'csv'
# require 'cinematheque/movie'
module Cinematheque
  # MovieCollection parses file to array of Movie objects and keep it
  class MovieCollection
    attr_accessor :colection

    def movies_parse(file_name)
      hash_keys = %w[links title year country date genre time rating directors actors]
      CSV.parse(File.read(file_name), col_sep: '|', headers: hash_keys).map do |el|
        # make symbol
        hash = el.to_h.transform_keys(&:to_sym)
        Movie.new(hash)
      end
    end

    def initialize
      # Converts a pathname to an absolute pathname.
      # First arg file name,
      # second arg __dir__ or __FILE__ - Returns the absolute path of the dir, file from which this method is called.
      file_path = File.expand_path('./data/movies.txt')
      @collection = movies_parse(file_path)
    end

    # 5.2.2
    def all
      @collection
    end

    # 5.2.3
    # guard clauses
    # (&field)
    def movie_sort(field)
      return raise 'Wrong argument' unless all[0].respond_to?(field)

      all.sort_by { |el|  el.send(field) }
    end

    # 5.2.4
    def movie_filter(field)
      key = field.keys[0]
      value = field.values[0]
      return raise 'Wrong argument' unless all[0].respond_to?(key)

      all.filter { |el| el.send(key).include?(value) }
    end

    # 5.2.5
    def movie_stats(field)
      return raise 'Wrong argument' unless all[0].respond_to?(field)

      all.each_with_object(Hash.new(0)) do |el, acc|
        str_value = el.send(field)
        acc[str_value] += 1
      end
    end

    def available_genres
      all.map(&:genre).join(',').split(',').uniq
    end
  end
end
