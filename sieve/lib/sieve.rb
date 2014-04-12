require 'prime'
require 'pry'

class Sieve

  attr_reader :maximum

  def initialize(max)
    @maximum = max
  end

  def primes
    collection = []
    prime.each do |prime|
      break if prime >= maximum
      collection << prime
    end
    collection
  end

end
