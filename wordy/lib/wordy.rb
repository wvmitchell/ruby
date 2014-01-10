class WordProblem

  def initialize(question)
    operation = parts(question.tr("^0-9A-Za-z -", "").split(" "))
    @first = question_parts[2].to_i
    @second = question_parts[4].to_i
    @arguments = find_arguments(question_parts)
    @operations = find_operations(question_parts)
    @operation = question_parts[3]
  end

  def answer
    case @operation
    when 'plus'
      @first + @second
    when 'minus'
      @first - @second
    end
  end

  def find_arguments(question_parts)
  end

  def find_operations(question_parts)
  end

end
