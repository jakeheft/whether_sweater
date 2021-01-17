require 'rails_helper'

describe ForecastsFacade do
	it 'get_forecasts()' do
		lat_lng = {lat: 30.264979, lng: -97.746598}
		forecast = ForecastsFacade.get_forecasts(lat_lng)

		expect(forecast).to be_a(Weather)
		require 'pry'; binding.pry
	end
end