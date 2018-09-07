class TempConverter
  attr_accessor :degrees_kelvin

  def to_farenheit
    return @degrees_kelvin * 9/5 - 459.67
  end

  def to_celsius
    return @degrees_kelvin - 273.15
  end

  def self.from_kelvin(degrees_k)
    converter = self.new
    converter.degrees_kelvin = degrees_k
    return converter
  end
end