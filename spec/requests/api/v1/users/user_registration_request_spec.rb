require 'rails_helper'

describe 'When a user registers' do
	it 'can pass registration data through json to create a User' do
		headers = {"CONTENT_TYPE" => "application/json"}
		user_params = {
  		"email": "jake@example.com",
  		"password": "password",
  		"password_confirmation": "password"
		}
		
		expect(User.last).to eq(nil)

		post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
		
		expect(response).to be_successful
		expect(response.status).to eq(201)
		expect(User.last).to be_a(User)
		expect(User.last.id).to be_an(Integer)
		expect(User.last.email).to be_a(String)
		expect(User.last.email).to eq('jake@example.com')
		expect(User.last.api_key).to be_a(String)

		user_data = JSON.parse(response.body, symbolize_names: true)

		expect(user_data).to be_a(Hash)
		expect(user_data).to have_key(:data)
		expect(user_data[:data]).to be_a(Hash)
		expect(user_data[:data]).to have_key(:type)
		expect(user_data[:data][:type]).to be_a(String)
		expect(user_data[:data][:type]).to eq('users')
		expect(user_data[:data]).to have_key(:id)
		expect(user_data[:data][:id]).to be_a(String)
		expect(user_data[:data]).to have_key(:attributes)
		expect(user_data[:data][:attributes]).to be_a(Hash)
		expect(user_data[:data][:attributes]).to have_key(:email)
		expect(user_data[:data][:attributes][:email]).to be_a(String)
		expect(user_data[:data][:attributes][:email]).to eq('jake@example.com')
		expect(user_data[:data][:attributes]).to have_key(:api_key)
		expect(user_data[:data][:attributes][:api_key]).to be_a(String)
	end

	it "won't allow a user to register if email already taken" do
		create(:user, email: 'jake@example.com')
		headers = {"CONTENT_TYPE" => "application/json"}
		user_params = {
  		"email": "jake@example.com",
  		"password": "password",
  		"password_confirmation": "password"
		}

		post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

		expect(response.status).to eq(409)
		expect(response).to_not be_successful

		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data).to be_a(Hash)
		expect(error_data).to have_key(:data)
		expect(error_data[:data]).to be_a(Hash)
		expect(error_data[:data]).to have_key(:id)
		expect(error_data[:data][:id]).to eq(nil)
		expect(error_data[:data]).to have_key(:type)
		expect(error_data[:data][:type]).to eq('error')
		expect(error_data[:data]).to have_key(:message)
		expect(error_data[:data][:message]).to eq('this email already exists in the system')
	end

	it 'must verify password matches password confirmation' do
		headers = {"CONTENT_TYPE" => "application/json"}
		user_params = {
  		"email": "jake@example.com",
  		"password": "password",
  		"password_confirmation": "wordpass"
		}

		post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
		
		expect(response.status).to eq(403)

		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data).to be_a(Hash)
		expect(error_data).to have_key(:data)
		expect(error_data[:data]).to be_a(Hash)
		expect(error_data[:data]).to have_key(:id)
		expect(error_data[:data][:id]).to eq(nil)
		expect(error_data[:data]).to have_key(:type)
		expect(error_data[:data][:type]).to eq('error')
		expect(error_data[:data]).to have_key(:message)
		expect(error_data[:data][:message]).to eq('passwords did not match')		
	end

	it "won't register if field empty" do
		headers = {"CONTENT_TYPE" => "application/json"}
		user_params = {
  		"email": "jake@example.com",
  		"password": "password"
		}

		post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

		expect(response.status).to eq(403)

		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data).to be_a(Hash)
		expect(error_data).to have_key(:data)
		expect(error_data[:data]).to be_a(Hash)
		expect(error_data[:data]).to have_key(:id)
		expect(error_data[:data][:id]).to eq(nil)
		expect(error_data[:data]).to have_key(:type)
		expect(error_data[:data][:type]).to eq('error')
		expect(error_data[:data]).to have_key(:message)
		expect(error_data[:data][:message]).to eq('passwords did not match')

		user_params = {
  		"email": "jake@example.com",
  		"password_confirmation": "password"
		}

		post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

		expect(response.status).to eq(403)

		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data).to be_a(Hash)
		expect(error_data).to have_key(:data)
		expect(error_data[:data]).to be_a(Hash)
		expect(error_data[:data]).to have_key(:id)
		expect(error_data[:data][:id]).to eq(nil)
		expect(error_data[:data]).to have_key(:type)
		expect(error_data[:data][:type]).to eq('error')
		expect(error_data[:data]).to have_key(:message)
		expect(error_data[:data][:message]).to eq('passwords did not match')

		user_params = {
			"password": "password",
			"password_confirmation": "password"
		}

		post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

		expect(response.status).to eq(403)

		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data).to be_a(Hash)
		expect(error_data).to have_key(:data)
		expect(error_data[:data]).to be_a(Hash)
		expect(error_data[:data]).to have_key(:id)
		expect(error_data[:data][:id]).to eq(nil)
		expect(error_data[:data]).to have_key(:type)
		expect(error_data[:data][:type]).to eq('error')
		expect(error_data[:data]).to have_key(:message)
		expect(error_data[:data][:message]).to eq('email must be entered')
	end

	# test for missing field
	# For login spec
	# test for password incorrect (401 error) 'the email or password entered was incorrect'
	# test for email incorrect (401 error) 'the email or password entered was incorrect'

end