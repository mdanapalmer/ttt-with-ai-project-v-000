require 'pry'
class Board
attr_accessor :cells

def reset!
  @cells.clear
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def initialize
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

def position(user_input)
  @cells[user_input.to_i - 1]
end

def full?
  @cells.all? { |taken| taken == "X" || taken == "O" }
end

def turn_count
  @cells.select {|occupied| occupied == "X" || occupied == "O"}.count
end

def taken?(input)
  position(input) != " " || position(input) == ""
end

def valid_move?(input)
  input.to_i.between?(1,9) && !taken?(input)
end

def update(input, player)
    cells[input.to_i-1] = player.token
end

end
