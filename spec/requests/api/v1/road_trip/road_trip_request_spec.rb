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

	it "will error if origin field doesn't exist" do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
			'destination': 'Denver,CO',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		expect(response).to_not be_successful
		expect(response.status).to eq(400)
		
		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data[:data][:message]).to eq('missing location')
	end

	it "will error if departure field doesn't exist" do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
			'origin': 'Denver,CO',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		expect(response).to_not be_successful
		expect(response.status).to eq(400)
		
		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data[:data][:message]).to eq('missing location')
	end

	it 'will error out if either location is ambiguous' do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
  		'origin': 'Denver,CO',
  		'destination': 'york',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data[:data][:message]).to eq('ambiguous results, please refine query')
	end
	
	it 'will error out if either location is ambiguous' do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
  		'origin': 'williams',
  		'destination': 'Denver,CO',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data[:data][:message]).to eq('ambiguous results, please refine query')
	end

	it 'will error out if location does not exist' do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
  		'origin': 'askdjhflas',
  		'destination': 'Denver,CO',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)
		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data[:data][:message]).to eq('invalid location queried')
	end

	it 'checks future weather, not current weather' do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
  		'origin': 'Denver,CO',
  		'destination': 'Bozeman,MT',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}
		forecast_data = ForecastsFacade.get_forecasts('Bozeman,MT')
		current_temp = forecast_data.current_weather.temp
		
		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		trip_data = JSON.parse(response.body, symbolize_names: true)
		trip_weather = trip_data[:data][:attributes][:weather_at_eta][:temperature]

		expect(trip_weather).to_not eq(current_temp)
	end

	it 'can still get weather data after 48 hours driving' do
		create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
		headers = {'CONTENT_TYPE' => 'application/json'}
		trip_params = {
  		'origin': 'Anchorage,AK',
  		'destination': 'CorpusChristi,TX',
  		'api_key': 'jgn983hy48thw9begh98h4539h4'
		}

		post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

		expect(response).to be_successful
		expect(response.status).to eq(200)

		trip = JSON.parse(response.body, symbolize_names: true)

		expect(trip[:data][:attributes][:travel_time].split(' ').first.to_i).to be > 48
		expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to be_an(Integer).or be_a(Float)
	end
end