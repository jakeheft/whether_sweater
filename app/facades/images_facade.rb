class ImagesFacade
	def self.get_image(location)
		image_data = ImagesService.fetch_image(location)
		Image.new(image_data, location)
	end
end