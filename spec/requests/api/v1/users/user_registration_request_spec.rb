require 'rails_helper'

describe 'When a user registers' do
	it 'can pass registration data through json' do
		headers = {"CONTENT_TYPE" => "application/json"}
		user_params = {
  		"email": "jake@example.com",
  		"password": "password",
  		"password_confirmation": "password"
		}

	post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

	end
end