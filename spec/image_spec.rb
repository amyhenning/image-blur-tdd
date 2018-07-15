require 'spec_helper'

RSpec.describe Image, type: :model do
	describe "blurring should work" do
		it "should blur a standard image" do
			input = [
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 1, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0]
			]

			expected = [
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 1, 0, 0],
				[1, 1, 1, 0],
				[0, 1, 0, 0],
				[0, 0, 0, 0]
			]

			image = Image.new(input)
			expect(image.blur.nested_array).to eq expected
		end

		it "should blur a second image" do
			input = [
				[0, 0, 0, 0],
				[0, 0, 1, 0],
				[0, 0, 0, 0],
				[0, 1, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0]
			]

			expected = [
				[0, 0, 1, 0],
				[0, 1, 1, 1],
				[0, 1, 1, 0],
				[1, 1, 1, 0],
				[0, 1, 0, 0],
				[0, 0, 0, 0]
			]
			image = Image.new(input)
			expect(image.blur.nested_array).to eq expected
		end

		it "should blur a third image" do
			input = [
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[1, 0, 0, 0],
				[0, 0, 0, 0]
			]

			expected = [
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[1, 0, 0, 0],
				[1, 1, 0, 0],
				[1, 0, 0, 0]
			]
			image = Image.new(input)
			expect(image.blur.nested_array).to eq expected
		end
	end
end