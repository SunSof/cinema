require 'cinematheque/movie_collection'
require 'time'
# Theatre
class Theatre < Cinematheque::MovieCollection
  def schedule_map
    @schedule_map ||= {
      morning: { time: 8..11, matcher: ->(mov) { mov.instance_of?(AncientMovie) } },
      day: { time: 12..17, matcher: ->(mov) { mov.genre.include?('Comedy') || mov.genre.include?('Adventure') } },
      evening: { time: 18..23, matcher: ->(mov) { mov.genre.include?('Drama') || mov.genre.include?('Horror') } }
    }
  end

  def show(time)
    watch_time = Time.parse(time).strftime('%H').to_i
    find_time = schedule_map().values.find do |val|
      val[:time].include?(watch_time)
    end
    return raise('Theatre not working') if find_time.nil?

    films = all().select do |el|
      find_time[:matcher].call(el)
    end
    films.take(3)
  end

  def when?(title)
    film = all().find { |el| el.title.eql?(title) }
    return raise('No film with that title') if film.nil?

    find_t = schedule_map().values.find { |val| val[:matcher].call(film) }
    return raise('No filters for this film') if find_t.nil?

    first = find_t[:time].first
    film_time = film.time.to_i
    hour = ((first * 60) + film_time) / 60
    minutes = ((first * 60) + film_time) - (hour * 60)
    "#{first}:00 - #{hour}:#{minutes}"
  end
end
