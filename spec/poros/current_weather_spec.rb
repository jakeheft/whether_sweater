require 'rails_helper'

describe CurrentWeather do
	it 'exists with attributes' do
		data = {
			dt: 1610850396,
 			sunrise: 1610803668,
 			sunset: 1610841211,
 			temp: 48.56,
 			feels_like: 41.56,
 			pressure: 1018,
 			humidity: 30,
 			dew_point: 20.07,
 			uvi: 0,
 			clouds: 1,
 			visibility: 10000,
 			wind_speed: 3.33,
 			wind_deg: 113,
			weather: [
				{
					id: 800, main: "Clear",
					description: "clear sky",
					icon: "01n"
				}
			]
		}
		weather = CurrentWeather.new(data)

		expect(weather.date_time).to eq('2021-01-16 19:26:36 -0700')
		expect(weather.sunrise).to eq('2021-01-16 06:27:48 -0700')
		expect(weather.sunset).to eq('2021-01-16 16:53:31 -0700')
		expect(weather.temp).to eq(48.56)
		expect(weather.feels_like).to eq(41.56)
		expect(weather.humidity).to eq(30)
		expect(weather.uvi).to eq(0)
		expect(weather.visibility).to eq(10_000)
		expect(weather.conditions).to eq('clear sky')
		expect(weather.icon).to eq('01n')
	end
end