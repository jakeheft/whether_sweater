class RoadTripsFacade
	def self.create_trip(origin, destination, api_key)
		# call MapsService to get_trip_info - travel time, start city, end city (copy from test this morning)
		trip_info = MapsService.fetch_trip_info(origin, destination)
		require 'pry'; binding.pry
		# if trip info gets 'impossible route', then return that message
		# call MapService to get_coordinates
		# call ForecastService to get_forecast (with coordinates & destination)
	end
end