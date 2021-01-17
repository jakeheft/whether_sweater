require 'rails_helper'

describe DailyWeather do
	it 'exists with attributes' do
		data = {
			dt: 1611252000,
  		sunrise: 1611235592,
  		sunset: 1611273474,
  		temp: {
				day: 67.08, 
				min: 57.85, 
				max: 67.08, 
				night: 64.65, 
				eve: 65.7, 
				morn: 61.63
			},
  		feels_like: {
				day: 66.49, 
				night: 65.77, 
				eve: 67.96, 
				morn: 61.65
			},
  		pressure: 1016,
  		humidity: 87,
  		dew_point: 63.19,
  		wind_speed: 9.01,
  		wind_deg: 197,
  		weather: [
				{
					id: 500, 
					main: "Rain", 
					description: "light rain", 
					icon: "10d"
				}
			],
  		clouds: 99,
  		pop: 0.99,
  		rain: 1.28,
  		uvi: 1.88
		}
		weather = DailyWeather.new(data)

		expect(weather.date).to eq('2021-01-21')
		expect(weather.sunrise).to eq('2021-01-21 06:26:32 -0700')
		expect(weather.sunset).to eq('2021-01-21 16:57:54 -0700')
		expect(weather.max_temp).to eq(67.08)
		expect(weather.min_temp).to eq(57.85)
		expect(weather.conditions).to eq('light rain')
		expect(weather.icon).to eq('10d')
	end
	
	it '.get_date()' do
		date_time = 1610915015
		date = DailyWeather.get_date(date_time)

		expect(date).to eq('2021-01-17')
	end
end