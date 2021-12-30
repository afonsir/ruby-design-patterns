# frozen_string_literal: true

require_relative 'text_object'

class BritishTextObject
  attr_reader :string, :size_mm, :colour

  def initialize(string, size_mm, colour)
    @string = string
    @size_mm = size_mm
    @colour = colour
  end
end

# adapter

class BritishTextObject < TextObject
  def initialize(bto)
    @bto = bto
  end

  def color
    @bto.colour
  end

  def size_inches
    @bto.size_mm / 25.4
  end

  def text
    @bto.string
  end
end

# opening the class

require_relative 'british_text_object'

class BritishTextObject
  def color
    colour
  end

  def size_inches
    size_mm / 25.4
  end

  def text
    string
  end
end

# modifying a single instance

bto = BritishTextObject.new('hello', 50.8, :blue)

class << bto
  def color
    colour
  end

  def size_inches
    size_mm / 25.4
  end

  def text
    string
  end
end
