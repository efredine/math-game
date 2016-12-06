require './player'
require './turn'

class Game

  def initialize(number_of_players = 2, lives = 3)
    puts "Initalizing game with #{number_of_players} players, each with #{lives} lives."
    @players = (1..number_of_players).map {|i| Player.new(i, lives)}
    @dead_players = []
  end

  def play
    surviving_players = @players
    while surviving_players.length > 1 do
      surviving_players = surviving_players.select do |player|
        Turn.new(player).play
        player.alive?
      end
    end
    puts '*********************************************************'
    if surviving_players.length > 0 then
      puts "\nPlayer #{surviving_players.first.player_number} WON!!!!\n"
    else
      puts 'Nobody won!'
    end
  end
end
