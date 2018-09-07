module OpenWeatherMap
  class Client
    ROOT_URL = 'api.openweathermap.org/data/2.5/'

    def initialize(api_key)
      @api_key = api_key
    end

    def get_weather(city)
      response_json = {
        main: {
          temp: 280.23,
          pressure: 1012,
          humidity: 81,
          temp_min: 279.15,
          temp_max: 281.15
        }
      }

      return map_weather_response(response_json)
    end

    private

    def map_weather_response(response_json)
      weather = WeatherResponse.new

      main = WeatherResponse::Main.new
      main.temp = response_json[:main][:temp]
      main.pressure = response_json[:main][:pressure]
      main.humidity = response_json[:main][:humidity]
      main.temp_min = response_json[:main][:temp_min]
      main.temp_max = response_json[:main][:temp_max]

      weather.main = main

      return weather
    end
  end
end