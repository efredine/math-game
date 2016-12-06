require './question'

class Turn

  def initialize(player)
    @player = player
  end

  def play
    question = Question.new
    @player.add_question(question)
    puts "\nNEW TURN ----------------------------------Player #{@player.player_number}"
    puts "#{question.question_text}"
    question.answer_given = $stdin.gets.chomp.to_i
    stats = "#{@player.correct_answers}/#{@player.questions_answered}"
    if question.correct? then
      puts "Hurray, you got it right. #{stats}"
    else
      puts "Boo, you got it wrong.  #{stats}"
    end
    puts "Sorry player #{@player.player_number} YOU'RE DEAD.\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" unless @player.alive?
  end
end
