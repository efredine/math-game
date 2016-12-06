module MathGame
  class Player

    attr_reader(:player_number, :lives)

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

    def incorrect_answers
      self.questions_answered - self.correct_answers
    end

    def lives_remaining
      @lives - self.incorrect_answers
    end

    def alive?
      self.lives_remaining > 0
    end

    def add_question(question)
      @questions << question
    end
  end
end