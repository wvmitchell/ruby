class Clock
  include Comparable

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  attr_reader :hour, :minute

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def to_s
    hour_string = hour < 10 ? "0#{hour}" : hour.to_s
    minute_string = minute < 10 ? "0#{minute}" : minute.to_s
    "#{hour_string}:#{minute_string}"
  end

  def +(minutes)
    @minute = minute + minutes
    correct_time
    self.to_s
  end

  def -(minutes)
    @minute = minute - minutes
    correct_time
    self.to_s
  end

  def <=>(other)
    hour <=> other.hour
  end

  private

  def correct_time
    if minute > 59
      @hour += minute / 60
      @minute = minute % 60
    end

    if minute < 0
      @hour += minute / 60
      @minute = minute % 60
    end

    if hour > 23
      @hour = hour % 24
    end

    if hour < 0
      @hour = 24 + hour
    end
  end

end
