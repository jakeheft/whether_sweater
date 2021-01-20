class RoadTrip
	attr_reader :travel_time, :start_city, :end_city, :weather_at_eta
	def initialize(trip, weather)
		# require 'pry'; binding.pry
		@travel_time = readable_time(trip[:route][:formattedTime])
		@start_city = readable_city(trip[:route][:locations][0])
		@end_city = readable_city(trip[:route][:locations][1])
		@weather_at_eta = formatted_weather(weather)
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

	def formatted_weather(weather)
		if weather[:temp].class == Hash
			{temperature: weather[:temp][:max], conditions: weather[:weather][0][:description]}
		else
			{temperature: weather[:temp], conditions: weather[:weather][0][:description]}
		end
	end
end