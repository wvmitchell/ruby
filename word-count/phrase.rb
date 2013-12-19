class Phrase

  attr_reader :phrase_passed_in

  def initialize(phrase)
    @phrase_passed_in = phrase.downcase
  end

  def word_count
    words_collection = phrase_passed_in.scan(/\w+/)
    counts = words_collection.map { |word| words_collection.count(word)}
    Hash[words_collection.zip(counts)]
  end

end