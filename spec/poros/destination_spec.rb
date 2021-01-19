require 'rails_helper'

describe Destination do
	it 'exists with attributes' do
		time_data = "01:44:22"
		location_data = {
			adminArea5: 'Pueblo',
      adminArea3: 'CO',
		}
		destination = Destination.new(time_data, location_data)

		expect(destination).to be_a(Destination)
		expect(destination.city).to eq('Pueblo, CO')
		expect(destination.travel_time).to eq('01 hours 44 min')
	end
end