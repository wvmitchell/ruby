class Queens

  attr_reader :white, :black

  def initialize(args={})
    @white = args[:white] || [0,3]
    @black = args[:black] || [7,3]
  end

end
