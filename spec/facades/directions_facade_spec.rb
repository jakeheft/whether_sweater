require 'rails_helper'

describe DirectionsFacade do
	it '.get_destination_info' do
		start = 'denver,co'
		ending = 'pueblo,co'

		destination = DirectionsFacade.get_destination_info(start, ending)

		expect(destination).to be_a(Destination)
	end
end