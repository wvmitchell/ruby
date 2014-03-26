class CustomSet
  include Comparable

  attr_reader :elements

  def initialize(elements=[])
    @elements = elements
  end

  def delete(element)
    elements.delete_if do |test_element|
      test_element == element && test_element.class == element.class
    end
    self
  end

  def difference(other)
    CustomSet.new(elements.sort - other.elements.sort)
  end

  def intersection(other)
    CustomSet.new(elements.sort & other.elements.sort)
  end

  def disjoint?(other)
    elements.sort & other.elements.sort == []
  end

  def member?(element)
    elements.any? do |test_element|
      test_element == element && test_element.class == element.class
    end
  end

  def empty
    @elements = []
    self
  end

  def <=>(other)
    elements.sort <=> other.elements.sort
  end

end
