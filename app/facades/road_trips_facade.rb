class RoadTripsFacade
	def self.create_trip(origin, destination)
		trip_info = MapsService.fetch_trip_info(origin, destination)
		return 'impossible route' if trip_info[:info][:statuscode] == 402
		hours_to_destination = trip_hours(trip_info[:route][:formattedTime])
		coordinates = get_coordinates(destination)
		forecast = ForecastsService.fetch_forecast(coordinates)
		if hours_to_destination <= 47
			RoadTrip.new(trip_info, forecast[:hourly][hours_to_destination])
		else
			days_to_destination = hours_to_destination / 24
			RoadTrip.new(trip_info, forecast[:daily][days_to_destination])
		end
	end

	def self.trip_hours(time)
		split_time = time.split(':')
		hours = split_time[0].to_i
		hours += 1 if split_time[1].to_i >= 30
		hours
	end

	def self.get_coordinates(location)
		coordinate_data = MapsService.fetch_coordinates(location)
		if coordinate_data[:results][0][:locations].count > 3
			return 'ambiguous results, please refine query'
		else
			coords = get_lat_long(coordinate_data)
			if coords == ({:lat=>39.390897, :lng=>-99.066067})
				'invalid location queried'
			else
				coords
			end
		end
	end

	def self.get_lat_long(coordinate_data)
		coordinate_data[:results][0][:locations][0][:latLng]
	end
end