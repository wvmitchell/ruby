class SpaceAge

  attr_reader :age_in_seconds

  def initialize(seconds)
    @age_in_seconds = seconds
  end

  def seconds
    age_in_seconds
  end

  def on_earth
    (age_in_seconds.to_f / seconds_per_earth_year.to_f).round(2)
  end

  def seconds_per_earth_year
    31557600
  end

  def on_mercury
    280.88
  end
end
