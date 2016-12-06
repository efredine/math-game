class Player

  attr_reader :player_number

  def initialize(player_number, lives)
    @player_number = player_number
    @lives = lives
    @questions = []
  end

  def hit
    @lives -= 1
  end

  def alive?
    @lives > 0
  end
end
