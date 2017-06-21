require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :player_one, :player_two, :current_player
  attr_accessor :mark, :board

  def initialize(player_one, player_two)
    @player_one, @player_two = player_one, player_two
    player_one.mark, player_two.mark = :X, :O
    @current_player = player_one
    @board = Board.new
  end



  def play
    while board.winner.nil?
      play_turn
    end
    # print "-" * board.grid.length * 12
    # puts ""
    # board.grid.each do |row|
    #   row.each do |pos|
    #     if !pos.nil?
    #       print " | #{pos} | "
    #     else
    #       print " |   | "
    #     end
    #   end
    #   print "\n"
    # end
    # render # no idea why this doesnt work
    puts "#{current_player.name} won!"
  end

  def play_turn
    current_player.display(board)
    move = current_player.get_move
    board.place_mark(move, current_player.mark)
    switch_players! if board.winner.nil?
  end

  def switch_players!
    if @current_player == player_one
      @current_player = player_two
    else
      @current_player = player_one
    end
  end
end

if $0 == __FILE__
  puts "Welcome to TicTacToe!"
  print "Please enter your name: "
  player1 = HumanPlayer.new(gets.chomp)
  print "Please enter your computers name: "
  player2 = ComputerPlayer.new(gets.chomp)
  game = Game.new(player1, player2)
  game.play
end
