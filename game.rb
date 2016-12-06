require './player'
require './turn'

class Game

  def initialize(number_of_players = 2, lives = 3)
    puts "Initalizing game with #{number_of_players} players, each with #{lives} lives."
    @players = (1..number_of_players).map {|i| Player.new(i, lives)}
    @dead_players = []
  end

  def play
    while @players.length > 1 do
      surviving_players = @players.select do |player|
        Turn.new(player).play
        player.alive?
      end
      @players = surviving_players
    end
  end
end
