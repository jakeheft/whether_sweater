require 'rails_helper'

describe 'Weather API' do
	it 'can get weather for a city' do
		get '/api/v1/forecast?location=denver,co'
		
		expect(response).to be_successful
		
	end

	xit 'can get coordinates needed in request' do
		get '/api/v1/forecast?location=denver,co'

		expect(response).to be_successful
		require 'pry'; binding.pry
	end
	### sad path for incorrect results (maybe if just city is entered and multiple results come back, that wouldn't be good)

	### with above, test it must have city and state/country and must be separated by comma

	### sad path for if 'a,a' entered in (since it would still include text on either side of a comma)
end