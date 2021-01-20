class ForecastsFacade
	def self.get_forecasts(location)
		lat_lng = get_coordinates(location)
		return lat_lng if lat_lng == 'invalid location queried'
		return lat_lng if lat_lng == 'ambiguous results, please refine query'
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

	def self.get_coordinates(location)
		coordinate_data = MapsService.fetch_coordinates(location)
		if coordinate_data[:results][0][:locations].count > 3
			return 'ambiguous results, please refine query'
		else
			coords = get_lat_long(coordinate_data)
			if coords == ({:lat=>39.390897, :lng=>-99.066067})
				'invalid location queried'
			else
				coords
			end
		end
	end

	def self.get_lat_long(coordinate_data)
		coordinate_data[:results][0][:locations][0][:latLng]
	end
end