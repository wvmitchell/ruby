class CustomSet
  include Comparable

  attr_reader :elements

  def initialize(elements)
    @elements = elements
  end

  def delete(element)
    elements.delete_if do |test_element|
      test_element == element && test_element.class == element.class
    end
    self
  end

  def difference(other)
    self.class.new(elements.sort & other.elements.sort)
  end

  def <=>(other)
    elements.sort <=> other.elements.sort
  end

end
