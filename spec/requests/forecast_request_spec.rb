require 'rails_helper'

describe 'Weather API' do
	it 'can get coordinates needed in request' do
		get '/api/v1/forecast?location=denver,co'

		expect(response).to be_successful
		require 'pry'; binding.pry
	end
	### sad path for incorrect results (maybe if just city is entered and multiple results come back, that wouldn't be good)
end