class HourlyWeather
	attr_reader :time, :temp, :wind_speed, :wind_direction, :conditions, :icon

	def initialize(data)
		@time = get_time(data[:dt])
		@temp = data[:temp]
		@wind_speed = "#{data[:wind_speed]} mph"
		@wind_direction = get_direction(data[:wind_deg])
		@conditions = data[:weather][0][:description]
		@icon = data[:weather][0][:icon]
	end

	def get_time(date_time)
		Time.at(date_time).to_s[11..15]
	end

	def get_direction(wind_deg)
		directions = ['N','NNE','NE','ENE','E','ESE', 'SE', 'SSE','S','SSW','SW','WSW','W','WNW','NW','NNW', 'N']
		converted_deg = (wind_deg/22.5 + 0.5).to_i
		"from #{directions[converted_deg]}"
	end
end