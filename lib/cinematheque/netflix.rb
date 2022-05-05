# Online theatre
class Netflix < Cinematheque::MovieCollection
  def show(**filters)
    filters.reduce(all) do |acc, filter|
      acc.select { |elem| apply_filter(elem, filter) }
    end
  end

  private

  def apply_filter(element, filter)
    key, value = filter
    return raise 'Wrong argument' unless element.respond_to?(key)

    element.send(key).include?(value)
  end
end
