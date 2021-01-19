require 'rails_helper'

describe Restaurant do
	it 'exists with attributes' do
		data = {
			id: "M4MwxQAA58B7ENV8ootI-w",
 			alias: "kans-kitchen-pueblo",
 			name: "Kan's Kitchen",
 			image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/RxBfJ3hjre51jCpXqNlfjA/o.jpg",
 			is_closed: false,
 			url: "https://www.yelp.com/biz/kans-kitchen-pueblo?adjust_creative=hLVXR0MIhyJhliv5ar9z7g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=hLVXR0MIhyJhliv5ar9z7g",
 			review_count: 20,
 			categories: [
				{
					alias: "chinese", 
					title: "Chinese"
				}, 
				{
					alias: "hotdogs", 
					title: "Fast Food"
				}
			],
 			rating: 4.5,
 			coordinates: {
				 latitude: 38.2401504516602, 
				 longitude: -104.643249511719
				},
 			transactions: ["delivery"],
 			price: "$",
 			location: {
				 address1: "1620 S Prairie Ave", 
				 address2: nil, 
				 address3: nil, 
				 city: "Pueblo",
				 zip_code: "81005", 
				 country: "US", 
				 state: "CO", 
				 display_address: ["1620 S Prairie Ave", "Pueblo, CO 81005"]
			},
 			phone: "+17195660209",
 			display_phone: "(719) 566-0209",
			distance: 6975.853345952662
		}
		restaurant = Restaurant.new(data)

		expect(restaurant).to be_a(Restaurant)
		expect(restaurant.name).to eq("Kan's Kitchen")
		expect(restaurant.address).to eq('1620 S Prairie Ave, Pueblo, CO 81005')
	end
end