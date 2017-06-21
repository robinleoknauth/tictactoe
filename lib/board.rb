class Board
  attr_reader :grid

  

  def initialize(grid = Array.new(3) { Array.new(3) })
    @grid = grid
  end

  def empty?(position)
    x, y = position
    @grid[x][y].nil?
  end

  def place_mark(position, mark)
    x, y = position
    @grid[x][y] = mark
  end

  def winner
    @grid.each do |row|
      return row.first if row.all? { |el| row.first == el && !el.nil? }
    end
    columns.each do |column|
      return column.first if column.all? { |el| el == column.first && !el.nil? }
    end

    if diagonal_falling.all? { |el| el == diagonal_falling.first }
      return  diagonal_falling.first
    end

    if diagonal_rising.all? { |el| el == diagonal_rising.first }
      return  diagonal_rising.first
    end
    nil
  end

  def over?
    winner || @grid.flatten.flatten.all? { |pos| !pos.nil? }
  end

  def columns
    columns = Array.new(@grid.length) { [] }
    @grid.each do |row|
      row.each_with_index do |position, index|
        columns[index] << position

      end
    end
    columns
  end

  def diagonal_falling
    @grid.map.with_index { |row, i| row[i] }
  end

  def diagonal_rising
    @grid.reverse.map.with_index { |row, i| row[i] }
  end

  def board
    @grid
  end

  def [](pos)
    grid[pos.first][pos.last]
  end

  def []=(pos, mark)
    @grid[pos.first][pos.last] = mark
  end

  # def display
  #   puts "---------------"
  #   (0..@grid.length-1).each do |idx|
  #     p @grid[idx].join(" | ")
  #     puts "---------------"
  #   end
  # end

end
