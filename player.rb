module MathGame
  class Player

    attr_reader :player_number

    def initialize(player_number, lives)
      @player_number = player_number
      @lives = lives
      @questions = []
    end

    def correct_answers
      @questions.count {|q| q.correct?}
    end

    def questions_answered
      @questions.length
    end

    def alive?
      self.questions_answered - self.correct_answers < @lives
    end

    def add_question(question)
      @questions << question
    end
  end
end