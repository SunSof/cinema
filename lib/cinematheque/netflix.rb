# Online theatre
class Netflix < Cinematheque::MovieCollection
  attr_accessor :balance

  def initialize
    super
    @balance = 0
  end

  # filtered by the given parameters
  # return a random movie with the highest rating
  def show(**filters)
    filters.reduce(all().shuffle) do |acc, filter|
      acc.select { |elem| apply_filter(elem, filter) }
    end
           .sort_by { |el| el.rating.to_f * rand() }.last(1)
  end

  def film_price
    show.map(&:price).join.to_i
  end

  def increase_balance(coins)
    @balance += coins
  end

  def decrease_balance
    return raise('Not enough money') if @balance < film_price()

    @balance -= film_price()
  end

  private

  # check if the parameter exists and is comparable to the value
  def apply_filter(element, filter)
    key, value = filter
    return raise('Wrong argument') unless element.respond_to?(key)

    element.send(key).include?(value)
  end
end
