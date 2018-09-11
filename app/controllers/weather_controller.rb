class WeatherController < ApplicationController
  def index
    @city = params[:city]

    if @city.blank?
      render 'missing'
      return
    end

    weather_client = WeatherService.get_client
    weather_response = weather_client.get_weather_by_city(@city)

    if weather_response.cod == '404'
      render 'unknown'
      return
    end

    @temp_farenheit = TempConverter.from_kelvin(weather_response.main.temp).to_farenheit
  end
end