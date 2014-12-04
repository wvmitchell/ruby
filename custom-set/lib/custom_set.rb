require 'set'

class CustomSet < Set

  def empty
    self.delete_if {|value| true }
  end

  alias_method :put, :add
  alias_method :subset?, :superset?
  alias_method :to_list, :to_a

end
