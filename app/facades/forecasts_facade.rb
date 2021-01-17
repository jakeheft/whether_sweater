class ForecastsFacade
	# def self.get_forecasts(lat_lng)
	# 	forecast_data = ForecastsService.fetch_forecast(lat_lng)
	# 	weather = Weather.new(forecast_data)

	# 	require 'pry'; binding.pry
	# end

	def self.get_forecasts(lat_lng)
		### do we want to remove coordinates facade and call coordinates service from this method (like Ian suggested in video) - would need to call first, obviously
		forecast_data = ForecastsService.fetch_forecast(lat_lng)
		current_weather = CurrentWeather.new(forecast_data[:current])
		hourly_weather = forecast_data[:hourly][0..7].map do |hour_data|
			HourlyWeather.new(hour_data)
		end
		daily_weather = forecast_data[:daily][0..4].map do |daily_data|
			DailyWeather.new(daily_data)
		end
		Forecast.new(current_weather, hourly_weather, daily_weather)
	end
end