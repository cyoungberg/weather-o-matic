class WeatherService
  def self.get_client
    api_key = Rails.application.credentials.open_weather_map_api_key
    return OpenWeatherMap::Client.new(api_key)
  end
end