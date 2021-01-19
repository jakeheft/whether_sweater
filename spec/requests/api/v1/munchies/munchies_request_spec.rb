require 'rails_helper'

describe 'As a site visitor' do
	it 'can get directions and a restaurant of a certain type' do
		get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

		expect(response).to be_successful

		munchie_data = JSON.parse(response.body, symbolize_names: true)
		
		expect(munchie_data).to be_a(Hash)
		expect(munchie_data).to have_key(:data)
		expect(munchie_data[:data]).to be_a(Hash)
		expect(munchie_data[:data]).to have_key(:id)
		expect(munchie_data[:data][:id]).to eq(nil)
		expect(munchie_data[:data]).to have_key(:type)
		expect(munchie_data[:data][:type]).to eq('munchie')
		expect(munchie_data[:data]).to have_key(:attributes)
		expect(munchie_data[:data][:attributes]).to be_a(Hash)
		
		attributes = munchie_data[:data][:attributes]

		expect(attributes).to have_key(:destination_city)
		expect(attributes[:destination_city]).to be_a(String)
		expect(attributes).to have_key(:travel_time)
		expect(attributes[:travel_time]).to be_a(String)
		expect(attributes).to have_key(:forecast)
		expect(attributes[:forecast]).to be_a(Hash)
		expect(attributes[:forecast]).to have_key(:summary)
		expect(attributes[:forecast][:summary]).to be_a(String)
		expect(attributes[:forecast]).to have_key(:temperature)
		expect(attributes[:forecast][:temperature]).to be_a(String)

		restaurant = attributes[:restaurant]
		
		expect(restaurant).to be_a(Hash)
		expect(restaurant).to have_key(:name)
		expect(restaurant[:name]).to be_a(String)
		expect(restaurant).to have_key(:address)
		expect(restaurant[:address]).to be_a(String)
	end
end