require 'rails_helper'

describe ForecastsFacade do
	it '.get_forecasts()' do
		location = 'fairbanks,ak'
		forecast = ForecastsFacade.get_forecasts(location)

		expect(forecast).to be_a(Forecast)
		expect(forecast.current_weather).to be_a(CurrentWeather)
		expect(forecast.daily_weather).to be_an(Array)
		expect(forecast.daily_weather.count).to eq(5)
		expect(forecast.daily_weather.first).to be_a(DailyWeather)
		expect(forecast.hourly_weather).to be_an(Array)
		expect(forecast.hourly_weather.count).to eq(8)
		expect(forecast.hourly_weather.first).to be_a(HourlyWeather)
	end

	it '.get_coordinates()' do
		coordinates = ForecastsFacade.get_coordinates('denver,co')

		expect(coordinates).to be_a(Hash)
		expect(coordinates).to have_key(:lat)
		expect(coordinates[:lat]).to be_a(Float)
		expect(coordinates).to have_key(:lng)
		expect(coordinates[:lng]).to be_a(Float)
	end

	it '.get_lat_long()' do
		coordinate_data = {
			info: {
				statuscode: 0,
   			copyright: {
    			text: "© 2021 MapQuest, Inc.",
     			imageUrl: "http://api.mqcdn.com/res/mqlogo.gif",
					imageAltText: "© 2021 MapQuest, Inc."
				},
					 messages: []
				},
 			options: {
				maxResults: -1,
				thumbMaps: true,
				ignoreLatLngInput: false
			},
 			results: [
				{
					providedLocation: {
						location: "denver,co"
					},
    			locations: [
						{
							street: "",
       				adminArea6: "",
       				adminArea6Type: "Neighborhood",
       				adminArea5: "Denver",
       				adminArea5Type: "City",
       				adminArea4: "Denver County",
       				adminArea4Type: "County",
       				adminArea3: "CO",
       				adminArea3Type: "State",
       				adminArea1: "US",
       				adminArea1Type: "Country",
       				postalCode: "",
       				geocodeQualityCode: "A5XAX",
       				geocodeQuality: "CITY",
       				dragPoint: false,
       				sideOfStreet: "N",
       				linkId: "282041090",
       				unknownInput: "",
       				type: "s",
       				latLng: {
								lat: 39.738453,
								lng: -104.984853
							},
       				displayLatLng: {
								lat: 39.738453,
								lng: -104.984853
							},
							 mapUrl: "http://www.mapquestapi.com/staticmap/v5/map?key=uwc8HbUlDAwmKNU6OzCd0PxuGbsp5jhQ&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-1&scalebar=true&zoom=12&rand=-1264141034"
						}
					]
				}
			]
		}
		coordinates = ForecastsFacade.get_lat_long(coordinate_data)

		expect(coordinates).to eq({lat: 39.738453, lng: -104.984853})
	end

	it "doesn't get any results" do
		coordinates = ForecastsFacade.get_coordinates(' ')

		expect(coordinates).to eq('invalid location queried')
	end

	it "won't allow ambiguous results" do
		coordinates = ForecastsFacade.get_coordinates('york')

		expect(coordinates).to eq('ambiguous results, please refine query')
	end
end