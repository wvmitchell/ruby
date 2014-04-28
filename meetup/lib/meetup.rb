require 'humanize'

class Meetup
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, week_number)
    Date.new(year, month, possible_days(weekday).send(week_number))
  end

  private

  def possible_days(weekday)
    day_range = month == 2 ? (1..29) : (1..31)
    day_range.to_a.select do |day|
      time = Time.new(year, month, day)
      time.send((weekday.to_s + "?").to_sym)
    end
  end
end

class Array

  def teenth
    self.select do |num|
      num > 12 && num < 20
    end.first
  end

  nums = %w{second third fourth}
  nums.each_with_index do |num, index|
    define_method num do
      self[index + 1]
    end
  end


end
