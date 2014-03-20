class FoodChainSong

  def verse(number)
    start = animals.keys[number-1]
    v = "I know an old lady who swallowed a #{start}.\n"
    v += "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    v
  end

  def animals
    {
      fly: "I don't know why she swallowed the fly. Pehaps she'll die",
      spider: "wriggled and jiggled and tickled inside her."
    }
  end

end
