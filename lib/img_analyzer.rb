require 'chunky_png'
require 'oily_png'
require 'fileutils'
require 'comparator'
include ChunkyPNG::Color
include OilyPNG::Color

class ImgAnalyzer
  attr_reader :image_path
  def initialize(image, prefix = 'fail-')
    diff = compare("reference_images/#{image}", "test_images/#{image}")
    if diff.diff.any?
      FileUtils.mkdir_p 'different_images'
      diff.output.save(
        "different_images/#{prefix}#{image}"
      )
      @image_path = "different_images/#{prefix}#{image}"
    end
  end
end

private

def compare(image_1, image_2)
  Comparator.new(image_1, image_2)
end
