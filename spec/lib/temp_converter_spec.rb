require 'rails_helper'

describe TempConverter do
  describe '.to_farenheit' do
    subject = described_class.from_kelvin(297.25)

    it 'converts the temp to farenheit' do
      result = subject.to_farenheit
      expect(result).to be_within(0.01).of(75.38)
    end

    it 'converts the temp to celsius' do
      result = subject.to_celsius
      expect(result).to be_within(0.01).of(24.10)
    end
  end

  describe '.from_kelvin' do
    it 'returns a new instance from kelvin degrees' do
      result = described_class.from_kelvin(280.20)
      expect(result.degrees_kelvin).to eq(280.20)
    end
  end
end