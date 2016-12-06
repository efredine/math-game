class Turn

  def initialize(player)
    @player = player
  end

  def play
    puts '------------------------------------------'
    puts "#{@player.player_number} question:"
    $stdin.gets.chomp
    @player.hit
    puts "#{@player.player_number} dead" unless @player.alive?
  end
end
