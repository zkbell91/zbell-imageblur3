class Image
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def output_image
    @data.each do |pixel|
      puts pixel.join(" ")
    end
  end

  def create_index
    ones = []
    @data.each_with_index do |row, row_index|
      row.each_with_index do |pixel, col_index|
        ones << [row_index, col_index] if pixel == 1  
      end
    end
    ones
  end

  def manhattan_distance (x2, x1, y2, y1)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    return horizontal_distance + vertical_distance 
  end

  def blur(distance)
    ones = create_index
    @data.each_with_index do |row, row_current|
      row.each_with_index do |pixel, col_current|
        ones.each do |indexed_row, indexed_col|
          if manhattan_distance(indexed_col, col_current, indexed_row, row_current) <= distance
            @data[row_current][col_current] = 1                         
          end
        end
      end
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image.output_image
puts
image.blur(2)
image.output_image