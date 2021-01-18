require 'rails_helper'

describe ImagesSerializer do
	it 'can serialize an image object' do
		data = {
				urls:  {
					raw: 'https://images.unsplash.com/photo-1519424187720-db6d0fc5a5d2?ixid=MXwxOTg5MTl8MHwxfHNlYXJjaHwxfHxsb2NhdGlvbjolMjBkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1',
					},
				links:  {
					html: 'https://unsplash.com/photos/chaqHXlOzYs', 
				},
				user:  {
					name: 'Owen Lystrup',
					links:  {
						html: 'https://unsplash.com/@owencavlys',
					},
				}
			}
		location = 'ames,ia'
		image = Image.new(data, location)
		response = ImagesSerializer.new(image)
		
		expect(response).to be_a(ImagesSerializer)
	end
end