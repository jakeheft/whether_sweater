require 'rails_helper'

describe RoadTrip do
	it 'exists with attributes, short trip' do
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
		weather_data = {
			temp: -20.09,
			weather: [
				{
					description: 'bbbbrrrrrrr'
				}
			]
		}
		road_trip = RoadTrip.new(trip_data, weather_data)
		expected_weather = {
			temperature: -20.09,
			conditions: 'bbbbrrrrrrr'
		}

		expect(road_trip).to be_a(RoadTrip)		
		expect(road_trip.travel_time).to eq('9 hours, 13 min')
		expect(road_trip.start_city).to eq('Denver, CO')
		expect(road_trip.end_city).to eq('Des Moines, IA')
		expect(road_trip.weather_at_eta).to eq(expected_weather)
	end

	it 'exists with attributes, long trip' do
		trip_data = {
			route: {
				formattedTime: '49:13:50',
				locations: [{
					adminArea5: 'San Diego',
					adminArea3: 'CA'
				},
				{
					adminArea5: 'Caribou',
					adminArea3: 'ME'
				}
			]
			}
		}
		weather_data = {
			temp: {
				max: 99.80
			},
			weather: [
				{description: 'freaking hot'}
			]
		}
		road_trip = RoadTrip.new(trip_data, weather_data)
		expected_weather = {
			temperature: 99.80,
			conditions: 'freaking hot'
		}

		expect(road_trip).to be_a(RoadTrip)		
		expect(road_trip.travel_time).to eq('49 hours, 13 min')
		expect(road_trip.start_city).to eq('San Diego, CA')
		expect(road_trip.end_city).to eq('Caribou, ME')
		expect(road_trip.weather_at_eta).to eq(expected_weather)
	end

	### test for helper methods
end