class Destination
	attr_reader :city, :travel_time

	def initialize(time, city)
		@travel_time = readable_time(time)
		@city = "#{city[:adminArea5]}, #{city[:adminArea3]}"
	end

	def readable_time(time)
		### refactor to remove 0 from hour
		"#{time[0..1]} hours #{time[3..4]} min"
	end
end