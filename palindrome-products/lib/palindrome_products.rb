require 'prime'

class Palindromes

  attr_reader :max_factor, :min_factor, :generated

  def initialize(options)
    @max_factor = options[:max_factor]
    @min_factor = options[:min_factor] || 1
    @generated = []
  end

  def generate
    candidates = []
    (min_factor..max_factor).to_a.each do |i|
      (min_factor..max_factor).to_a.reverse.each do |j|
        c = i*j
        candidates << Palindrome.new(c, min_factor, max_factor) if palindrome?(c.to_s)
      end
    end
    @generated = candidates
    @generated.sort!
  end

  def largest
    generated.last
  end

  def smallest
    generated.first
  end

  private

  def palindrome?(number)
    if number.length == 1 || number.length == 0
      true
    else
      number[0] == number[-1] && palindrome?(number[1..-2])
    end
  end

end

class Palindrome
  include Comparable

  attr_reader :number, :min_factor, :max_factor

  def initialize(number, min_factor, max_factor)
    @number = number
    @min_factor = min_factor
    @max_factor = max_factor
  end

  def <=>(other)
    number <=> other.number
  end

  def value
    number
  end

  def factors
    single = (1..number).select {|n| number % n == 0}
    candidates = (single.zip single.reverse).each {|c| c.sort!}.uniq
    candidates.select do |pair|
      pair.all? {|factor| factor <= max_factor && factor >= min_factor}
    end
  end

end
