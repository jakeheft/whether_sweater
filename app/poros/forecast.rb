class Forecast
	attr_reader :current, :daily, :hourly

	def initialize(current, hourly, daily)
		@current = current
		@daily = daily
		@hourly = hourly
	end
end