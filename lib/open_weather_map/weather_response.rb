module OpenWeatherMap
  class WeatherResponse
    attr_accessor :cod, :main

    class Main
      attr_accessor :temp, :pressure, :humidity, :temp_min, :temp_max
      
    end

  end
end