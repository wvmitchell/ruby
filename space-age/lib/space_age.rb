class SpaceAge

  attr_reader :age_in_seconds

  def initialize(seconds)
    @age_in_seconds = seconds
  end

  def seconds
    age_in_seconds
  end

  def earth_year
    31557600
  end

  def mercury_year
    7600526
  end

  def venus_year
    19411026
  end

  def mars_year
    59359777
  end

  def jupiter_year
    374222565
  end

  def saturn_year
    928792570
  end

  def uranus_year
    2652994592
  end

  def neptune_year
    5196280668
  end

  def on_earth
    age(earth_year)
  end

  def on_mercury
    age(mercury_year)
  end

  def on_venus
    age(venus_year)
  end

  def on_mars
    age(mars_year)
  end

  def on_jupiter
    age(jupiter_year)
  end

  def on_saturn
    age(saturn_year)
  end

  def on_uranus
    age(uranus_year)
  end

  def on_neptune
    age(neptune_year)
  end

  def age(planet_year_seconds)
    (age_in_seconds.to_f / planet_year_seconds.to_f).round(2)
  end

  def method_missing(name, *args)
    puts name
  end
end
