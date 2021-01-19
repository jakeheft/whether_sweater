require 'rails_helper'

describe MunchiesFacade do
	it '.get_destination_info' do
		start = 'denver,co'
		ending = 'pueblo,co'
		food = 'chinese'

		munchie = MunchiesFacade.get_munchies(start, ending, food)

		expect(munchie).to be_a(Munchie)
	end
end