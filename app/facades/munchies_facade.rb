class MunchiesFacade
	def self.get_munchies(start, ending)
		destination_info = DirectionsService.fetch_destination_info(start, ending)
		destination = Destination.new(destination_info[:route][:formattedTime], destination_info[:route][:locations][1])
		forecast = ForecastsFacade.get_forecasts(ending)
		require 'pry'; binding.pry
	end
end