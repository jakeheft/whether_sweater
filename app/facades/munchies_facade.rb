class MunchiesFacade
	def self.get_munchies(start, ending, food)
		destination_info = DirectionsService.fetch_destination_info(start, ending)
		destination = Destination.new(destination_info[:route][:formattedTime], destination_info[:route][:locations][1])
		forecast = ForecastsFacade.get_forecasts(ending)
		dest_time = time_at_destination(destination.travel_time)
		restaurant_data = RestaurantsService.fetch_restaurant(ending, food, dest_time)
		restaurant = Restaurant.new(restaurant_data[:businesses][0])
		Munchie.new(destination, forecast.current_weather, restaurant)
	end
	
	def self.time_at_destination(travel_time)
		hrs = travel_time[0..1].to_i
		mins = travel_time[9..10].to_i
		time = Time.now + hrs.hours + mins.minutes
		time.to_i
	end
end