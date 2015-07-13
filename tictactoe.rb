require 'pry'

# Draw a board that has 9 squares. 

# have loop
# User puts in x in empty square 
# check if won
# then computer puts in o in empty square. 
# check if won
# end loop if someone wins or if no empty squares

# 3 in a row wins.

# Create a hash with numbers that represent squares on the box and their values inside the squares
def create_b_hash
b = {}
[1,2,3,4,5,6,7,8,9].each {|num| b[num] = ""}
b
end

# Draw the tic tac toe board 
def draw_board(b)
system 'clear'
puts " #{b[1]} | #{b[2]} | #{b[3]} "
puts "-------------"
puts " #{b[4]} | #{b[5]} | #{b[6]} "
puts "-------------"
puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

# Create an array of all the empty square numbers
def empty_squares(b)
  empty_hash = b.select {|k,v| v == ""}
  empty = empty_hash.keys
  empty
end

# Check for a win
# If 3 squares in a row has same value, then win == true
def check_win(b)
  winning_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[3,5,8],[3,6,9],[1,5,9],[3,5,7]]
  winning_lines.each do |x,y,z|
    if b[x] == b[y] && b[x] == b[z] && b[x] == "X"
      return "You"
    elsif b[x] == b[y] && b[x] == b[z] && b[x] == "O"
      return "Computer"
    end
  end
  nil
end

# Give the value of hash created in create_b_hash method to a variable b_hash 
# Pass b_hash to draw_board method so that all squares values can be shown on board
b_hash = create_b_hash
draw_board(b_hash)

begin

  begin
  puts "Select an empty square to put your X in. Enter a number between 1 to 9:"
  player_sq = gets.chomp.to_i

  # Check if player puts X in empty square
  # loop until empty_squares array does not include? player_sq
  end until empty_squares(b_hash).include?(player_sq)

  b_hash[player_sq] = "X"
  draw_board(b_hash)

  # Check for win
  winner = check_win(b_hash)

  # Computer places his O randomly in an empty square
  computer_sq = empty_squares(b_hash).sample
  b_hash[computer_sq] = "O"
  draw_board(b_hash)

  # Check for win
  winner = check_win(b_hash)

#end loop when empty_squares .empty? returns true or when someone wins
end until empty_squares(b_hash).empty? || winner

if winner
  puts "#{winner} won!"
else
  puts "Its a tie!"
end

# Hard computer
# First check if two O in a row. Put third O there
# Next check if two X in a row, Put third O there

# If turn == 1 and If player puts in center, put in corner
## If player puts in corner, put in corner

# If turn == 1 and if player puts in corner, put in center
## If player puts in corner, put in middle

# If turn == 1 and if player puts in middle, put in center
## If player puts in corner, put in opposite corner
