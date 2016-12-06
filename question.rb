module MathGame
  class Question

    CHOICES = *(1..20)

    attr_accessor :answer_given

    def initialize
      @a = CHOICES.sample
      @b = CHOICES.sample
      @answer_given = nil
    end

    def question_text
      "What is #{@a} plus #{@b}?"
    end

    def correct?
      answer_given == @a + @b
    end

  end
end