require 'csv'
module Cinematheque
  # MovieCollection parses file to array of Movie objects and keep it
  class MovieCollection
    attr_accessor :colection

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

    def create_movie(hash)
      year = hash[:year].to_i
      case year
      when 1900..1945
        AncientMovie.new(hash)
      when 1945..1968
        ClassicMovie.new(hash)
      when 1968..2000
        ModernMovie.new(hash)
      when 2000..2022
        NewMovie.new(hash)
      end
    end

    # guard clauses
    # (&field)
    def movie_sort(field)
      return raise 'Wrong argument' unless all[0].respond_to?(field)

      all.sort_by { |el|  el.send(field) }
    end

    def movie_filter(field)
      key = field.keys[0]
      value = field.values[0]
      return raise 'Wrong argument' unless all[0].respond_to?(key)

      all.filter { |el| el.send(key).include?(value) }
    end

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

    def show
      random_movie = all.sample
      time_now = Time.now
      time_over = time_now + random_movie.time.to_i * 60
      time_now_str, time_over_str = [time_now, time_over].map { |t| t.strftime('%H:%M') }
      "Now showing: #{random_movie.title} (#{time_now_str}) - (#{time_over_str})"
    end
  end
end
