class Weather
	attr_reader :date_time, :sunrise, :sunset, :temp
	def initialize(data)
		# require 'pry'; binding.pry
		@date_time = Time.at(data[:current][:dt]).to_s
		@sunrise = Time.at(data[:current][:sunrise]).to_s
		@sunset = Time.at(data[:current][:sunset]).to_s
		@temp = data[:current][:temp]
	end

	# def readable_time(dt)
	# 	require 'pry'; binding.pry
		
	# end
end