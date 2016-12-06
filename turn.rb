require './question'

module MathGame
  class Turn

    def initialize(player)
      @player = player
    end

    def play
      question = MathGame::Question.new
      @player.add_question(question)
      puts "\nNEW TURN ----------------------------------Player #{@player.player_number}"
      puts "#{question.question_text}"
      question.answer_given = $stdin.gets.chomp.to_i
      lives_stats = "#{@player.lives_remaining} of #{@player.lives} lives remaining"
      stats = "#{@player.correct_answers}/#{@player.questions_answered} questions answered correctly"
      if question.correct? then
        puts 'Hurray, you got it right.'
      else
        puts 'Boo, you got it wrong.'
      end
      puts "#{lives_stats} | #{stats}"
      puts "Sorry player #{@player.player_number} YOU'RE DEAD.\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" unless @player.alive?
    end
  end
end