require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board, :player1, :player2

  def initialize(name1 = 'Player 1', name2 = 'Player 2')
    @board = Board.new
    @player1 = Player.new(name1, 'X')
    @player2 = Player.new(name2, 'O')
    @current_player = @player1
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def game_start
    @board.display
    puts "Let's begin the game of TIC TAC TOE!"
    puts "#{@player1.name} is X and #{@player2.name} is O"

    while @board.game_status == 'continue'
      puts "#{@current_player.name}'s turn (#{@current_player.symbol})"
      move = gets.chomp.to_i
      @board.update(move, @current_player.symbol)
      @board.display
      switch_player
    end
    result = @board.game_status
    if result == 'tie'
      puts " It's a tie!"
    elsif result == 'X'
      puts "#{@player1.name} wins!"
    else
      puts "#{@player2.name} wins!"
    end
  end
end
