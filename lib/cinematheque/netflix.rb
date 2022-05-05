# Online theatre
class Netflix < Cinematheque::MovieCollection
  def show(**fields)
    fields.reduce(all) do |acc, (key, value)|
      return raise 'Wrong argument' unless acc[0].respond_to?(key)

      filter(acc, key, value)
    end
  end

  private

  def filter(acc, key, value)
    acc.filter do |el|
      el.send(key).include?(value)
    end
  end
end
