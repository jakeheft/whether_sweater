class Forecast
	attr_reader :current_weather, :daily_weather, :hourly_weather

	def initialize(current, hourly, daily)
		@current_weather = current
		@daily_weather = daily
		@hourly_weather = hourly
	end
end