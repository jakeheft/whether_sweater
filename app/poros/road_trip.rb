class RoadTrip
	def initialize(trip, weather)
		@travel_time = readable_time(trip[:route][:formattedTime])
		@start_city = readable_city(trip[:route][:locations][0])
		@end_city = readable_city(trip[:route][:locations][1])
	end

	def readable_time(time)
		time = time.split(':')
		hrs = time[0]
		hrs = time[0][1] if time[0][0] == '0'
		min = time[1]
		min = time[1][1] if time[1][0] == '0'
		"#{hrs} hours #{min} min"
	end

	def readable_city(location)
		"#{location[:adminArea5]}, #{location[:adminArea3]}"
	end
end