require 'rails_helper'

describe ForecastsFacade do
	it 'get_forecasts()' do
		lat_lng = {lat: 30.264979, lng: -97.746598}
		forecast = ForecastsFacade.get_forecasts(lat_lng)

		expect(forecast).to be_a(Forecast)
		expect(forecast.current).to be_a(CurrentWeather)
		expect(forecast.daily).to be_an(Array)
		expect(forecast.daily.count).to eq(5)
		expect(forecast.daily.first).to be_a(DailyWeather)
		expect(forecast.hourly).to be_an(Array)
		expect(forecast.hourly.count).to eq(8)
		expect(forecast.hourly.first).to be_a(HourlyWeather)
	end

	### test for it can detect ambiguous/vague search (incorrect city/state input, results are too many (greater than 3?))
end