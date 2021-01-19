class Munchie
	attr_reader :destination_city, :travel_time, :forecast, :restaurant

	def initialize(destination, forecast, restaurant)
		@destination_city = destination.city
		@travel_time = destination.travel_time
		@forecast = {summary: forecast.conditions, temperature: forecast.temp.to_i.to_s}
		@restaurant = {name: restaurant.name, address: restaurant.address}
	end
end