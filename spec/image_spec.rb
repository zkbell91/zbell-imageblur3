require 'spec_helper'

RSpec.describe Image do
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
      expect(image.blur(1)).to eq expected
    end

    it "should blur a two-pixel image" do
      input = [
        [0, 0, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
      ]

      expected = [
        [0, 0, 1, 0],
        [0, 1, 1, 1],
        [0, 1, 1, 0],
        [1, 1, 1, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
      ]
      image = Image.new(input)
      expect(image.blur(1)).to eq expected
    end

    it "should blur a pixel-edge image" do
      input = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [1, 0, 0, 0],
        [0, 0, 0, 0],
      ]

      expected = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [1, 0, 0, 0],
        [1, 1, 0, 0],
        [1, 0, 0, 0],
      ]
      image = Image.new(input)
      expect(image.blur(1)).to eq expected
    end

    it "should blur to the user-entered manhattan distance" do
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
        [0, 1, 0, 0],
        [1, 1, 1, 0],
        [1, 1, 1, 1],
        [1, 1, 1, 0],
        [0, 1, 0, 0]
      ]
      image = Image.new(input)
      expect(image.blur(2)).to eq expected
    end
  end
end