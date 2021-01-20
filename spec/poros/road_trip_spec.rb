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

	it '#readable_time' do
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

		expect(road_trip.readable_time("19:20:50")).to eq('19 hours, 20 min')
		expect(road_trip.readable_time(nil)).to eq('impossible route')
	end

	it '#readable_city()' do
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

		expect(road_trip.readable_city({:adminArea5=>"Denver", :adminArea3=>"CO"})).to eq('Denver, CO')
		expect(road_trip.readable_city('Denver,CO')).to eq('Denver,CO')
	end

	it '#formatted_weather()' do
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

		expect(road_trip.formatted_weather({:temp=>-20.09, :weather=>[{:description=>'bbbbrrrrrrr'}]})).to eq({temperature: -20.09, conditions: 'bbbbrrrrrrr'})
		expect(road_trip.formatted_weather({:temp=>{:max=>99.8}, :weather=>[{:description=>"freaking hot"}]})).to eq({temperature: 99.8, conditions: 'freaking hot'})
		expect(road_trip.formatted_weather({})).to eq({})
	end
end