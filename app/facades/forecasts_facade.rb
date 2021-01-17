class ForecastsFacade
	def self.get_forecasts(lat_lng)
		forecast_data = ForecastsService.fetch_forecast(lat_lng)
		weather = Weather.new(forecast_data)

		require 'pry'; binding.pry
	end
end