class MapsService
	def self.fetch_coordinates(location)
		conn = Faraday.new('https://www.mapquestapi.com')
		response = conn.get('/geocoding/v1/address') do |req|
			req.params[:key] = ENV['MAPQUEST_API_KEY']
			req.params[:location] = location
		end
		JSON.parse(response.body, symbolize_names: true)
	end
end