class ImagesService
	def self.fetch_image(location)
		conn = Faraday.new('https://api.unsplash.com') do |f|
			f.headers['Accept-Version'] = 'v1'
			f.headers['Authorization'] = ENV['UNSPLASH_API_KEY']
		end
		response = conn.get('/search/photos') do |req|
			req.params[:query] = "location: #{location}"
		end
		parsed_json = JSON.parse(response.body, symbolize_names: true)
		parsed_json[:results][0]
	end
end