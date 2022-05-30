require 'cinematheque/movie_collection'
require 'time'
# Theatre
class Theatre < Cinematheque::MovieCollection
  def show(time)
    watch_time = Time.parse(time).strftime('%H').to_i
    films = case watch_time
    when (8..13)
      all().select { |el| el.class == AncientMovie }
    when (14..18)
      all().select { |el| el.genre.include?('Comedy') || el.genre.include?('Adventure') }
    when (19..23)
      all().select { |el| el.genre.include?('Drama') || el.genre.include?('Horror') }
    else
      raise('Theatre not working')
    end
    films.take(3)
  end
end
