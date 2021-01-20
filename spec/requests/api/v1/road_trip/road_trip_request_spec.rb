require 'rails_helper'

describe 'As a registered user' do
	it 'can get trip info and destination weather of arrival time' do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
  		'origin': 'Denver,CO',
  		'destination': 'Pueblo,CO',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		expect(response).to be_successful
		expect(response.status).to eq(200)

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

	it "won't accept a request without a valid api_key" do
		create(:user, api_key: 'someoneelseskey')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
  		'origin': 'Denver,CO',
  		'destination': 'Pueblo,CO',
  		'api_key': 'mykey'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		expect(response).to_not be_successful
		expect(response.status).to eq(401)

		error = JSON.parse(response.body, symbolize_names: true)

		expect(error).to be_a(Hash)
		expect(error).to have_key(:data)
		expect(error[:data]).to be_a(Hash)
		expect(error[:data]).to have_key(:id)
		expect(error[:data][:id]).to eq(nil)
		expect(error[:data]).to have_key(:type)
		expect(error[:data][:type]).to be_a(String)
		expect(error[:data]).to have_key(:message)
		expect(error[:data][:message]).to be_a(String)
		expect(error[:data][:message]).to eq('invalid API key')
	end

	it 'will inform you if the route is not possible to drive' do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
  		'origin': 'Denver,CO',
  		'destination': 'London,UK',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		expect(response).to be_successful
		expect(response.status).to eq(200)

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
		expect(attributes[:travel_time]).to eq('impossible route')
		expect(attributes).to have_key(:weather_at_eta)
		expect(attributes[:weather_at_eta]).to eq({})
	end

	it "won't let you leave api_key field blank" do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
  		'origin': 'Denver,CO',
  		'destination': 'London,UK'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)
		
		expect(response).to_not be_successful
		expect(response.status).to eq(401)
		
		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data[:data][:message]).to eq('invalid API key')
	end

	it "won't let you leave destination field blank" do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
			'origin': 'Denver,CO',
			'destination': '',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		expect(response).to_not be_successful
		expect(response.status).to eq(400)
		
		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data[:data][:message]).to eq('missing location')
	end

	it "won't let you leave origin field blank" do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
			'origin': '',
			'destination': 'Denver,CO',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)
		
		expect(response).to_not be_successful
		expect(response.status).to eq(400)
		
		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data[:data][:message]).to eq('missing location')
	end

	### test for missing field
	### test if destination matches origin
	### test if longer than 48 hours (which is how much weather data supplied - use weather for the day) - test from anchorage,ak to panama city, panama (127 hours)
	### test that weather returned does not equal current weather at destination, or eta weather at origin
end