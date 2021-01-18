require 'rails_helper'

describe ForecastSerializer do
	xit 'can serialize a forecast' do
			forecast = Forecast.new(data)
			test = ForecastSerializer.new(forecast)
			require 'pry'; binding.pry
	end
end