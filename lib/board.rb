class Board
  def initialize
    @board = Array.new(9, ' ')
  end

  def display
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def update(position, symbol)
    @board[position] = symbol
  end

  def reset
    @board = Array.new(9, ' ')
  end

  def game_status
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    winning_combinations.each do |combo|
      a, b, c = combo
      if @board[a] == @board[b] && @board[b] == @board[c] && @board[a] != ' '
        return @board[a] # Zwraca 'X' lub 'O'
      end
    end

    return 'tie' unless @board.include?(' ')

    'continue'
  end
end
