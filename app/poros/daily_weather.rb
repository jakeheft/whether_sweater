class DailyWeather
	attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

	def initialize(data)
		@date = get_date(data[:dt])
		@sunrise = Time.at(data[:sunrise]).to_s
		@sunset = Time.at(data[:sunset]).to_s
		@max_temp = data[:temp][:max]
		@min_temp = data[:temp][:min]
		@conditions = data[:weather][0][:description]
		@icon = data[:weather][0][:icon]
	end

	def get_date(date_time)
		Time.at(date_time).to_s[0..9]
	end
end