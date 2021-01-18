class ForecastsService
	def self.fetch_forecast(lat_lng)
		conn = Faraday.new('http://api.openweathermap.org')
		response = conn.get('/data/2.5/onecall') do |req|
			req.params[:appid] = ENV['OPENWEATHER_API_KEY']
			req.params[:lat] = lat_lng[:lat]
			req.params[:lon] = lat_lng[:lng]
			req.params[:units] = 'imperial'
			req.params[:exclude] = 'minutely,alerts'
		end
		JSON.parse(response.body, symbolize_names: true)
	end
end