require 'rails_helper'

describe RoadTrip do
	it 'exists with attributes' do
		trip_data = {
			route: {
				formattedTime: '09:13:50',
				locations: [{
					adminArea5: 'Denver',
					adminArea3: 'CO'
				},
				{
					adminArea5: 'Des Moines',
					adminArea3: 'IA'
				}
			]
			}
		}
		weather_data = {}
		road_trip = RoadTrip.new(trip_data, weather_data)
	end

	### test for helper methods
end