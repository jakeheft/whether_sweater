require 'rails_helper'

describe ImagesFacade do
	it '.get_image()' do
		location = 'austin,tx'
		image = ImagesFacade.get_image(location)

		expect(image).to be_a(Image)
	end
end