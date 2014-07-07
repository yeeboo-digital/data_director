class Array
  
  def flip
    flipped = []
    self.each_with_index do |row, row_index|
      row.each_with_index do |value, value_index|
        flipped[value_index] ||= []
        flipped[value_index][row_index] = value
      end
    end
    flipped
  end
  
end