require 'rails_helper'

describe Munchie do
	it 'exists with attributes' do
		dest_data = {
			adminArea5: "Pueblo",
			adminArea3: "CO"
		}
		destination = Destination.new("01:44:22",dest_data)
		forecast = ForecastsFacade.get_forecasts('pueblo,co')
		rest_data = {
			name: "Kan's Kitchen",
			location: {
				display_address: ["1620 S Prairie Ave", "Pueblo, CO 81005"]
			}
		}
		restaurant = Restaurant.new(rest_data)

		munchie = Munchie.new(destination, forecast.current_weather, restaurant)

		expect(munchie).to be_a(Munchie)
		expect(munchie.destination_city).to eq("Pueblo, CO")
		expect(munchie.travel_time).to eq('01 hours 44 min')
		expect(munchie.forecast).to eq({:summary=>"light rain", :temperature=>"31"})
		expect(munchie.restaurant).to eq({:name=>"Kan's Kitchen", :address=>"1620 S Prairie Ave, Pueblo, CO 81005"})
	end
end