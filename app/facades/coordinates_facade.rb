class CoordinatesFacade
	def self.get_coordinates(location)
		# if results.count > 1
		# if results.count < 1
		coordinate_data = CoordinatesService.fetch_coordinates(location)
		coords = self.get_lat_long(coordinate_data)
	end

	def self.get_lat_long(coordinate_data)
		coordinate_data[:results][0][:locations][0][:latLng]
	end
end