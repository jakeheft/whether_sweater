require 'rails_helper'

describe MunchiesFacade do
	it '.get_destination_info' do
		start = 'denver,co'
		ending = 'pueblo,co'

		munchie = MunchiesFacade.get_munchies(start, ending)

		expect(munchie).to be_a(Munchie)
	end
end