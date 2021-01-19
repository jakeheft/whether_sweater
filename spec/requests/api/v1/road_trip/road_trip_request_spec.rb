require 'rails_helper'

describe 'As a registered user' do
	it 'can get trip info and destination weather of arrival time' do
		headers = {"CONTENT_TYPE" => "application/json"}
		trip_params = {
  		"origin": "Denver,CO",
  		"destination": "Pueblo,CO",
  		"api_key": "jgn983hy48thw9begh98h4539h4"
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		expect(response).to be_successful
		expect(response.status).to eq(201)

		trip = JSON.parse(response.body, symbolize_names: true)

		expect(trip).to be_a(Hash)
		expect(trip).to have_key(:data)
		expect(trip[:data]).to be_a(Hash)
		expect(trip[:data]).to have_key(:id)
		expect(trip[:data][:id]).to eq(nil)
		expect(trip[:data]).to have_key(:type)
		expect(trip[:data][:type]).to be_a(String)
		expect(trip[:data][:type]).to eq('roadtrip')
		expect(trip[:data]).to have_key(:attributes)
		expect(trip[:data][:attributes]).to be_a(Hash)

		attributes = trip[:data][:attributes]

		expect(attributes).to have_key(:start_city)
		expect(attributes[:start_city]).to be_a(String)
		expect(attributes).to have_key(:end_city)
		expect(attributes[:end_city]).to be_a(String)
		expect(attributes).to have_key(:travel_time)
		expect(attributes[:travel_time]).to be_a(String)
		expect(attributes).to have_key(:weather_at_eta)
		expect(attributes[:weather_at_eta]).to be_a(Hash)
		expect(attributes[:weather_at_eta]).to have_key(:temperature)
		expect(attributes[:weather_at_eta][:temperature]).to be_a(Float)
		expect(attributes[:weather_at_eta]).to have_key(:conditions)
		expect(attributes[:weather_at_eta][:conditions]).to be_a(String)
	end

	### test for no api key, 401 status returned
end