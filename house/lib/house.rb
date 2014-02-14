class House

  def verse(lines)
    start = "This is the "
    finish = "house that Jack built.\n"
    start + middle.take(lines-1).reverse.join + finish
  end

  def middle
    [
      'malt that lay in the ',
      'rat that ate the ',
      'cat that killed the ',
      'dog that worried the ',
      'cow with the crumpled horn that tossed the ',
      'maiden all forlorn that milked the ',
      'man all tattered and torn that kissed the ',
      'priest all shaven and shorn that married the ',
      'rooster that crowed in the morn that woke the ',
      'farmer sowing his corn that kept the ',
      'horse and the hound and the horn that belonged to the '
    ]
  end

end
