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

	it "doesn't get any results" do
		coordinates = RoadTripsFacade.get_coordinates(' ')

		expect(coordinates).to eq('invalid location queried')
	end

	it "won't allow ambiguous results" do
		coordinates = RoadTripsFacade.get_coordinates('york')

		expect(coordinates).to eq('ambiguous results, please refine query')
	end

	it 'will return a string if coordinates cannot be found' do
		coordinates1 = RoadTripsFacade.create_trip('york', 'denver,co')
		coordinates2 = RoadTripsFacade.create_trip('boston,ma', ' ')

		expect(coordinates1).to eq('ambiguous results, please refine query')
		expect(coordinates2).to eq('invalid location queried')
	end
end