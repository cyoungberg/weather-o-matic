class WeatherController < ApplicationController
  def index
    @city = params[:city]

    weather_client = OpenWeatherMap::Client.new(Rails.application.credentials.open_weather_map_api_key)
    weather = weather_client.get_weather(@city)

    @temp_farenheit = TempConverter.from_kelvin(weather.main.temp).to_farenheit
  end
end