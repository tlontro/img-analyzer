class Comparator
  attr_reader :diff, :output

  def initialize(image_1, image_2)
    images = [
      ChunkyPNG::Image.from_file(image_1),
      ChunkyPNG::Image.from_file(image_2)
    ]

    @output = ChunkyPNG::Image.new(images.first.width, images.first.height)
    @output = ChunkyPNG::Image.from_file(image_1)
    @diff = []
    images.first.height.times do |y|
      images.first.row(y).each_with_index do |pixel, x|
        begin
          if pixel == images.last[x,y]
            @output[x,y] = pixel
          else
            score = Math.sqrt(
              (r(images.last[x,y]) - r(pixel)) ** 2 +
              (g(images.last[x,y]) - g(pixel)) ** 2 +
              (b(images.last[x,y]) - b(pixel)) ** 2
              ) / Math.sqrt(MAX ** 2 * 3)
              @output[x,y] = ChunkyPNG::Color.rgb(255,0,0)
              @diff << score
          end
        rescue ChunkyPNG::OutOfBounds
        end
      end
    end

    return @output
  end
end
