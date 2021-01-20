require 'rails_helper'

describe 'As a registered user' do
	it 'can log in with their email password' do
		user = User.create!(
			email: 'jake@example.com',
			password: 'password',
			password_confirmation: 'password',
			api_key: '9834uoekdfhg9eo'
		)
		headers = {"CONTENT_TYPE" => "application/json"}
		login_params = {
  		"email": "jake@example.com",
  		"password": "password"
		}

		post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

		expect(response).to be_successful
		expect(response.status).to eq(200)

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
		expect(user_data[:data][:attributes][:api_key]).to eq('9834uoekdfhg9eo')
	end

	it "can't login with incorrect email" do
		user = User.create!(
			email: 'jake@example.com',
			password: 'password',
			password_confirmation: 'password',
			api_key: '9834uoekdfhg9eo'
		)
		headers = {"CONTENT_TYPE" => "application/json"}
		login_params = {
  		"email": "person@example.com",
  		"password": "password"
		}

		post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

		expect(response).to_not be_successful
		expect(response.status).to eq(401)

		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data).to be_a(Hash)
		expect(error_data).to have_key(:data)
		expect(error_data[:data]).to be_a(Hash)
		expect(error_data[:data]).to have_key(:id)
		expect(error_data[:data][:id]).to eq(nil)
		expect(error_data[:data]).to have_key(:type)
		expect(error_data[:data][:type]).to eq('error')
		expect(error_data[:data]).to have_key(:message)
		expect(error_data[:data][:message]).to eq('invalid login credentials')
	end

	it "can't login with incorrect password" do
		user = User.create!(
			email: 'jake@example.com',
			password: 'password',
			password_confirmation: 'password',
			api_key: '9834uoekdfhg9eo'
		)
		headers = {"CONTENT_TYPE" => "application/json"}
		login_params = {
  		"email": "jake@example.com",
  		"password": "PASSWORD"
		}

		post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

		expect(response).to_not be_successful
		expect(response.status).to eq(401)
		
		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data).to be_a(Hash)
		expect(error_data).to have_key(:data)
		expect(error_data[:data]).to be_a(Hash)
		expect(error_data[:data]).to have_key(:id)
		expect(error_data[:data][:id]).to eq(nil)
		expect(error_data[:data]).to have_key(:type)
		expect(error_data[:data][:type]).to eq('error')
		expect(error_data[:data]).to have_key(:message)
		expect(error_data[:data][:message]).to eq('invalid login credentials')
	end
end