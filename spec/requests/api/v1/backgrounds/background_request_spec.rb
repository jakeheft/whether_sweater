require 'rails_helper'

describe 'Unsplash API' do
	it 'can get a background photo of a city' do
		get '/api/v1/backgrounds?location=denver,co'

		expect(response).to be_successful

		photo_data = JSON.parse(response.body, symbolize_name: true)

		expect(photo_data).to be_a(Hash)
		expect(photo_data).to have_key(:data)
		expect(photo_data[:data]).to be_a(Hash)
		expect(photo_data[:data]).to have_key(:type)
		expect(photo_data[:data][:type]).to be_a(String)
		expect(photo_data[:data]).to have_key(:id)
		expect(photo_data[:data][:id]).to be_a(nil)
		expect(photo_data[:data]).to have_key(:attributes)
		expect(photo_data[:data][:attributes]).to be_a(Hash)

		attributes = photo_data[:data][:attributes]

		expect(attributes).to have_key(:location)
		expect(attributes[:location]).to be_a(String)
		expect(attributes).to have_key(:image_url)
		expect(attributes[:image_url]).to be_a(String)
		expect(attributes).to have_key(:photographer)
		expect(attributes[:photographer]).to be_a(String)
		expect(attributes).to have_key(:photographer_url)
		expect(attributes[:photographer_url]).to be_a(String)
		expect(attributes).to have_key(:site_credit)
		expect(attributes[:site_credit]).to be_a(String)
	end
end