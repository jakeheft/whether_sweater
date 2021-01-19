class RestaurantsService
	def self.fetch_restaurant(location, food, time)
		conn = Faraday.new('https://api.yelp.com') do |f|
			f.headers['Authorization'] = ENV['YELP_API_KEY']
		end
		response = conn.get('/v3/businesses/search') do |req|
			req.params['term'] = "#{food} food"
			req.params['location'] = location
			req.params['open_at'] = time
		end
		JSON.parse(response.body, symbolize_names: true)
	end
end