class DirectionsService
	def self.fetch_destination_info(start, ending)
		conn = Faraday.new('http://www.mapquestapi.com')
		response = conn.get('/directions/v2/route') do |req|
			req.params[:key] = ENV['MAPQUEST_API_KEY']
			req.params[:from] = start
			req.params[:to] = ending
		end
		JSON.parse(response.body, symbolize_names: true)
	end
end