class Question
  attr_reader :correct_answer

  def initialize(qs)
    @number1 = rand((qs/5).to_i..(qs))
    @number2 = rand((qs/5).to_i..(qs))
    @correct_answer = @number1 + @number2
  end

  def display_question
    "What does #{@number1} plus #{@number2} equals?"
  end

  def correct?(guess)
    guess == @correct_answer
  end
end