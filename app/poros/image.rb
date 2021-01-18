class Image
	attr_reader :location, :image_url, :photographer, :photographer_url, :site_credit

	def initialize(data, location)
		@location = location
		@image_url = data[:urls][:raw]
		@photographer = data[:user][:name]
		@photographer_url = data[:user][:links][:html]
		@site_credit = 'Image from Unsplash'
	end
end