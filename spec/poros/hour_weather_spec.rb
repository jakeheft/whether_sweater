require 'rails_helper'

describe HourWeather do
	it 'exists with attributes' do
		data = {
			dt: 1610928000,
  		temp: 59.18,
  		feels_like: 52.57,
  		pressure: 1019,
  		humidity: 37,
  		dew_point: 33.26,
  		uvi: 0,
  		clouds: 4,
  		visibility: 10000,
  		wind_speed: 5.61,
  		wind_deg: 44,
  		weather: [
				{
					id: 800,
					main: "Clear",
					description: "clear sky",
					icon: "01n"
				}
			],
			pop: 0
		}
		weather = HourWeather.new(data)

		expect(weather.time).to eq('17:00')
		expect(weather.temp).to eq(59.18)
		expect(weather.wind_speed).to eq('5.61 mph')
		expect(weather.wind_direction).to eq('from NE')
		expect(weather.conditions).to eq('clear sky')
		expect(weather.icon).to eq('01n')
	end

	it '.get_direction()' do
		date_time = 1610884140
		time = HourWeather.get_time(date_time)

		expect(time).to eq('04:49')
	end

	it '.get_direction()' do
		wind_deg1 = 99
		wind_deg2 = 0
		wind_deg3 = 360
		wind_deg4 = 237.8

		direction1 = HourWeather.get_direction(wind_deg1)
		direction2 = HourWeather.get_direction(wind_deg2)
		direction3 = HourWeather.get_direction(wind_deg3)
		direction4 = HourWeather.get_direction(wind_deg4)

		expect(direction1).to eq('from E')
		expect(direction2).to eq('from N')
		expect(direction3).to eq('from N')
		expect(direction4).to eq('from WSW')
	end
end