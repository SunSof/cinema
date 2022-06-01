require 'cinematheque/movie_collection'
# Online theatre
class Netflix < Cinematheque::MovieCollection
  attr_accessor :balance

  def initialize
    super
    @balance = 0
  end

  def increase_balance(coins)
    @balance += coins
  end

  # filtered by the given parameters
  # return a random movie with the highest rating
  def show(**filters)
    film = filters.reduce(all().shuffle) do |acc, filter|
             acc.select { |elem| apply_filter(elem, filter) }
           end
                  .max_by { |el| el.rating.to_f * rand() }
    return raise('Not movies this filters') if film.nil?
    return raise('Not enough money') if @balance < film.price

    decrease_balance(film)
    film
  end

  def how_much?(title)
    film = all().find { |el| el.title.eql?(title) }
    return raise('No movies with that name') unless film

    film.price
  end

  private

  def decrease_balance(film)
    @balance -= film.price
  end
end

private

# check if the parameter exists and is comparable to the value
def apply_filter(element, filter)
  key, value = filter
  if key == :period
    class_name = periods.dig(value, :class_name)
    element.instance_of?(class_name)
  else
    return raise('Wrong argument') unless element.respond_to?(key)

    element.send(key).include?(value)
  end
end
