class HumanPlayer
  attr_accessor :name, :mark, :board


  def initialize(name)
    @name = name
  end

  def display(board)
    print "-" * board.grid.length * 12
    puts ""
    board.grid.each do |row|
      row.each do |pos|
        if !pos.nil?
          print " | #{pos} | "
        else
          print " |   | "
        end
      end
      print "\n"
    end
  end



  def get_move
    puts "Where would you like to place your mark?"
    move = gets.chomp
    move.split(",").map!(&:to_i)
    
  end

end
