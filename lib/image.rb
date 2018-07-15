class Image
	attr_accessor :nested_array

	def initialize(nested_array)
		@nested_array = nested_array
	end

	def blur
 		ones = Hash.new

    @nested_array.each_index do |row|
      @nested_array[row].each_with_index do |pixel, pixel_index|
        if pixel == 1
          ones[row] = pixel_index
        end
      end
    end

    ones.each do |row, pixel_index|
      row_below = row + 1
      row_above = row - 1
      pixel_left = pixel_index - 1
      pixel_right = pixel_index + 1
      # UP
      unless @nested_array[row_above][pixel_index] == nil
        if row_above >= 0
          @nested_array[row_above][pixel_index] = 1 # transform the pixels above the original 1
        end
      end
      # DOWN
      unless row_below >= @nested_array.length
          @nested_array[row_below][pixel_index] = 1 # transform the pixel directly below the original 1
      end
      # LEFT
      unless pixel_index == 0
        if pixel_left >= 0
          @nested_array[row][pixel_left] = 1 # transform the pixel to the left, with conditions
        end
      end
      # RIGHT
      unless @nested_array[row][pixel_right] == nil
        @nested_array[row][pixel_right] = 1 # transform the pixel to the right of the original 1
      end
    end
		return Image.new(@nested_array)
	end
end