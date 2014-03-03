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
        candidates << Palindrome.new(c) if palindrome?(c.to_s)
      end
    end
    @generated = candidates
    @generated.sort!
  end

  def largest
    generated.last
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

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def <=>(other)
    number <=> other.number
  end

  def value
    number
  end

  def factors
    single = (1..number).select {|n| number % n == 0}
    single.zip single.reverse
  end

end
