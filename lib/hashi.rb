require "hashi/version"
require 'rmagick'
require 'set'

module Hashi
  module_function

  def image_file
    @file = ARGV[0] || 'stencil.png'
  end

  def image
    @image ||= Magick::Image.read(image_file).first
  end

  def dots_image_file
    name, extension = image_file.split('.')
    "#{name}-dots.#{extension}"
  end

  def draw
    @draw ||= Magick::Draw.new
  end

  def finish!
    puts "#{@hashi_map.size} hashies will be needed!"
    print "drawing the new image.."
    img = Magick::Image.new(Hashi.image.rows, Hashi.image.columns)
    draw.draw(img)
    img.write(dots_image_file)
    `open #{dots_image_file}`
    print "... done!"
  end

  def hashi_size
    @hashi_size ||= ARGV[1]&.to_i || 10
  end

  def hashi_padding
    @hashi_padding ||= ARGV[2]&.to_i || hashi_size * 3
  end

  def padding
    @padding ||= hashi_size + hashi_padding
  end

  def navigate_on_pixels_with_index
    i = 0
    image.each_pixel do |pixel|
      row = i / image.rows
      col = i % image.columns
      if (row % padding).zero? &&
         (col % padding).zero?
        yield pixel, row, col, i
      end
      i += 1
    end
  end

  def process!
    @hashi_map = Set.new
    navigate_on_pixels_with_index do |pixel, row, col, index|
      if pixel.to_color != "white"
        hashi_on(row, col)
      end
    end
    finish!
  end

  def hashi_on row, col
    tuple =[row, col]
    return if @hashi_map.include? tuple
    @hashi_map << tuple

    draw.circle(col, row, col + hashi_size, row + hashi_size)
  end
end
