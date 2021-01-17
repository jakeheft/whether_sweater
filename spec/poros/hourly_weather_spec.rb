require 'rails_helper'

describe HourlyWeather do
	before(:each) do
		@data = {
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
	end

	it 'exists with attributes' do
		weather = HourlyWeather.new(@data)

		expect(weather.time).to eq('17:00')
		expect(weather.temp).to eq(59.18)
		expect(weather.wind_speed).to eq('5.61 mph')
		expect(weather.wind_direction).to eq('from NE')
		expect(weather.conditions).to eq('clear sky')
		expect(weather.icon).to eq('01n')
	end

	it '.get_direction()' do
		weather = HourlyWeather.new(@data)
		date_time = 1610884140
		time = weather.get_time(date_time)

		expect(time).to eq('04:49')
	end

	it '.get_direction()' do
		weather = HourlyWeather.new(@data)
		direction1 = weather.get_direction(360)
		direction2 = weather.get_direction(0)
		direction3 = weather.get_direction(28)
		direction4 = weather.get_direction(42.99998)
		direction5 = weather.get_direction(60)
		direction6 = weather.get_direction(79)
		direction7 = weather.get_direction(102)
		direction8 = weather.get_direction(146)
		direction9 = weather.get_direction(150)
		direction10 = weather.get_direction(180)
		direction11 = weather.get_direction(193.7754)
		direction12 = weather.get_direction(220)
		direction13 = weather.get_direction(245)
		direction14 = weather.get_direction(281.24)
		direction15 = weather.get_direction(281.25)
		direction16 = weather.get_direction(320)
		direction17 = weather.get_direction(328)

		expect(direction1).to eq('from N')
		expect(direction2).to eq('from N')
		expect(direction3).to eq('from NNE')
		expect(direction4).to eq('from NE')
		expect(direction5).to eq('from ENE')
		expect(direction6).to eq('from E')
		expect(direction7).to eq('from ESE')
		expect(direction8).to eq('from SE')
		expect(direction9).to eq('from SSE')
		expect(direction10).to eq('from S')
		expect(direction11).to eq('from SSW')
		expect(direction12).to eq('from SW')
		expect(direction13).to eq('from WSW')
		expect(direction14).to eq('from W')
		expect(direction15).to eq('from WNW')
		expect(direction16).to eq('from NW')
		expect(direction17).to eq('from NNW')
	end
end