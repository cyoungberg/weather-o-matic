class WeatherController < ApplicationController
  def index
    @city = params[:city]

    weather_client = WeatherService.get_client
    weather = weather_client.get_weather_by_city(@city)

    @temp_farenheit = TempConverter.from_kelvin(weather.main.temp).to_farenheit
  end
end