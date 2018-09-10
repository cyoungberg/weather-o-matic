require 'rails_helper'

describe OpenWeatherMap::Client do
  subject { described_class.new('APIKEY') }

  describe '#get_weather_by_city' do
    let (:parsed_response) {
      { 
        'main' => {
          'temp' => 280.32,
          'pressure' => 1012,
          'humidity' => 81,
          'temp_min' => 279.15,
          'temp_max' => 281.15
        }
      }
    }

    it 'requests the weather for the specified city' do
      expect(subject).to receive(:get)
        .with('weather', { q: 'Deadwood'})
        .and_return(parsed_response)
      subject.get_weather_by_city('Deadwood')
    end

    it 'returns the mapped response' do
      allow(subject).to receive(:get).and_return(parsed_response)
      results = subject.get_weather_by_city('Deadwood')
      expect(results.main.temp).to eq(280.32)
    end
  end

  describe '#map_weather_response' do
    let (:parsed_response) {
      { 
        'main' => {
          'temp' => 280.32,
          'pressure' => 1012,
          'humidity' => 81,
          'temp_min' => 279.15,
          'temp_max' => 281.15
        }
      }
    }

    it 'maps the temp' do
      results = subject.send(:map_weather_response, parsed_response)
      expect(results.main.temp).to eq(280.32)
    end

    it 'maps the pressure' do
      results = subject.send(:map_weather_response, parsed_response)
      expect(results.main.pressure).to eq(1012)
    end

    it 'Maps the etc....' do
      # etc...
    end
  end

  describe '#get' do
    let(:response_body) { <<-JSON
{
  "coord": {
    "lon": -0.13,
    "lat": 51.51
  },
  "weather": [
    {
      "id": 300,
      "main": "Drizzle",
      "description": "light intensity drizzle",
      "icon": "09d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 280.32,
    "pressure": 1012,
    "humidity": 81,
    "temp_min": 279.15,
    "temp_max": 281.15
  },
  "visibility": 10000,
  "wind": {
    "speed": 4.1,
    "deg": 80
  },
  "clouds": {
    "all": 90
  },
  "dt": 1485789600,
  "sys": {
    "type": 1,
    "id": 5091,
    "message": 0.0103,
    "country": "US",
    "sunrise": 1485762037,
    "sunset": 1485794875
  },
  "id": 2643743,
  "name": "Deadwood",
  "cod": 200
}
JSON
}
    let (:response) { double(Faraday::Response, body: response_body) }
    let (:connection) { double(Faraday) }

    before do
      allow(subject).to receive(:conn).and_return(connection)
    end

    it 'makes a request to the weather service with an api key' do
      expect(connection).to receive(:get)
        .with('some_path', { some_param: 'some_val', appid: 'APIKEY' } )
        .and_return(response)

      subject.send(:get, 'some_path', { some_param: 'some_val' })
    end
  end
end