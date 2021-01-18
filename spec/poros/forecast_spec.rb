require 'rails_helper'

describe Forecast do
	it 'exists with attributes' do
		current_data = {
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
		daily_data = {
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
		hourly_data = {
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
		current_weather = CurrentWeather.new(current_data)
		daily_weather = DailyWeather.new(daily_data)
		hourly_weather = HourlyWeather.new(hourly_data)
		forecast = Forecast.new(current_weather, hourly_weather, daily_weather)
		expect(forecast.current_weather).to eq(current_weather)
		expect(forecast.current_weather).to be_a(CurrentWeather)
		expect(forecast.daily_weather).to eq(daily_weather)
		expect(forecast.daily_weather).to be_a(DailyWeather)
		expect(forecast.hourly_weather).to eq(hourly_weather)
		expect(forecast.hourly_weather).to be_a(HourlyWeather)
	end
end