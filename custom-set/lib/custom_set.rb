class CustomSet
  include Comparable

  attr_reader :elements

  def initialize(elements=[])
    @elements = elements.to_a.uniq
  end

  def delete(element)
    elements.delete_if do |test_element|
      exact_match(test_element, element)
    end
    self
  end

  def put(element)
    elements << element
    elements.uniq!
    self
  end

  def empty
    @elements = []
    self
  end

  def difference(other)
    CustomSet.new(elements.sort - other.elements.sort)
  end

  def intersection(other)
    CustomSet.new(elements.sort & other.elements.sort)
  end

  def size
    elements.length
  end

  def to_list
    elements
  end

  def disjoint?(other)
    elements.sort & other.elements.sort == []
  end

  def member?(element)
    elements.any? do |test_element|
      exact_match(test_element, element)
    end
  end

  def subset?(other)
    intersection(other) == other
  end

  def <=>(other)
    elements.sort <=> other.elements.sort
  end

  private

  def exact_match(first, second)
    first == second && first.class == second.class
  end

end
