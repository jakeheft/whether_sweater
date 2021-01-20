class MapsService
	def self.fetch_coordinates(location)
		response = conn.get('/geocoding/v1/address') do |req|
			req.params[:key] = ENV['MAPQUEST_API_KEY']
			req.params[:location] = location
		end
		parsed(response)
	end

	def self.fetch_trip_info(origin, destination)
		response = conn.get('/directions/v2/route') do |req|
			req.params[:key] = ENV['MAPQUEST_API_KEY']
			req.params[:from] = origin
			req.params[:to] = destination
		end
		parsed(response)
	end

	private
	def self.conn
		Faraday.new('https://www.mapquestapi.com')
	end

	def self.parsed(response)
		JSON.parse(response.body, symbolize_names: true)
	end
end