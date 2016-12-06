require './player'
require './turn'

module MathGame
  class Game

    def initialize(number_of_players = 2, lives = 3)
      puts "Initalizing game with #{number_of_players} players, each with #{lives} lives."
      @players = (1..number_of_players).map {|i| MathGame::Player.new(i, lives)}
    end

    def play
      surviving_players = @players
      while surviving_players.length > 1 do
        surviving_players = surviving_players.select do |player|
          MathGame::Turn.new(player).play
          player.alive?
        end
      end
      puts '*********************************************************'
      if surviving_players.length > 0 then
        puts "\nPlayer #{surviving_players.first.player_number} WON!!!!\n"
      else
        puts "\nNobody won!\n"
      end
    end
  end
end