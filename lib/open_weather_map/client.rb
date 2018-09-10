module OpenWeatherMap
  class Client
    ROOT_URL = 'https://api.openweathermap.org/data/2.5/'

    def initialize(api_key)
      @api_key = api_key
    end

    def get_weather_by_city(city)
      response = get('weather', { q: city })
      return map_weather_response(response)
    end

    private

    def get(path, options)
      options ||= {}
      options[:appid] = @api_key

      response = conn.get path, options
      
      return JSON.parse(response.body)
    end

    def conn
      return Faraday.new(url: ROOT_URL) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end
    
    def map_weather_response(response_json)
      # just mapping a few keys for now - see spec for example response
      weather = WeatherResponse.new

      main = WeatherResponse::Main.new
      main.temp     = response_json['main']['temp']
      main.pressure = response_json['main']['pressure']
      main.humidity = response_json['main']['humidity']
      main.temp_min = response_json['main']['temp_min']
      main.temp_max = response_json['main']['temp_max']

      weather.main = main

      return weather
    end
  end
end