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
      (max_factor..min_factor).to_a.each do |j|
        canditates << i*j
      end
    end

    @generated = candidates
  end

  def largest
    generated.last
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
