class Phrase

  def initialize(words)
    @words = words.split
  end

  def word_count
    @words.each_with_object({}) do |word, counts|
      counts[word] ? counts[word] += 1 : counts[word] = 1
    end
  end

end
