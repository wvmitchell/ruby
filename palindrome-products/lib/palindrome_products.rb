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
        candidates << (i*j)
      end
    end

    @generated = candidates.select {|candidate| palindrome?(candidate.to_s)}
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

class Fixnum

  def value
    self
  end

  def factors
    single_factors = self.prime_division.collect do |factor, exponent|
      (0..exponent).to_a.collect do |exp|
        factor ** exp
      end
    end.flatten

    factor_pairs = []
    single_factors.each_with_index do |factor, index|
      factor_pairs << [factor, single_factors[-1 - index]]
    end

    factor_pairs.each {|pair| pair.sort!}
    factor_pairs.uniq
  end

end
