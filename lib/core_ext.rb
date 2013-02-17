class Array
  # Split in 2 (or other) columns
  def slice_in(cols = 2)
    per_col = self.length / cols + 1
    array = []
    cols.times do |i|
      a_start = i * per_col
      a_end   = a_start + per_col
      array << self[a_start...a_end]
    end
    array
  end
end
