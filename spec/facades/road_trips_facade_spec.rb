require 'rails_helper'

describe RoadTripsFacade do
	it '.create_trip(), shorter than 48 hours' do
		origin = 'Denver,CO'
		destination = 'Austin,TX'
		road_trip = RoadTripsFacade.create_trip(origin, destination)
		
		expect(road_trip).to be_a(RoadTrip)
	end

	it '.create_trip(), longer than 48 hours' do
		origin = 'SanDiego,CA'
		destination = 'Caribou,ME'
		road_trip = RoadTripsFacade.create_trip(origin, destination)
		
		expect(road_trip).to be_a(RoadTrip)
	end

	it 'returns impossible route' do
		origin = 'SanDiego,CA'
		destination = 'Berlin,DE'
		road_trip = RoadTripsFacade.create_trip(origin, destination)

		expect(road_trip.travel_time).to eq('impossible route')
	end

	### test helper methods (trip hours, get coordinates, get lat lng)
end