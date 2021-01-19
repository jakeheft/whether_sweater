require 'rails_helper'

describe RoadTripsFacade do
	it '.create_trip()' do
		origin = 'Denver,CO'
		destination = 'Austin,TX'
		api_key = 'Sdfiodso*DfSD89sdf'

		road_trip = RoadTripsFacade.create_trip(origin, destination, api_key)
		expect(road_trip).to be_a(RoadTrip)
	end
end