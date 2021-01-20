require 'rails_helper'

describe RoadTripsFacade do
	it '.create_trip(), shorter than 48 hours' do
		origin = 'Denver,CO'
		destination = 'Austin,TX'
		api_key = 'Sdfiodso*DfSD89sdf'

		road_trip = RoadTripsFacade.create_trip(origin, destination, api_key)
		expect(road_trip).to be_a(RoadTrip)
	end

	it '.create_trip(), longer than 48 hours' do
		origin = 'SanDiego,CA'
		destination = 'Caribou,ME'
		api_key = 'Sdfiodso*DfSD89sdf'

		road_trip = RoadTripsFacade.create_trip(origin, destination, api_key)
		expect(road_trip).to be_a(RoadTrip)
	end

	### test helper methods (trip hours, get coordinates, get lat lng)
end