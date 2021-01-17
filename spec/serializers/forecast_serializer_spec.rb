require 'rails_helper'

describe ForecastSerializer do
	it 'can serialize a forecast' do
		data = {
			lat: 30.265,
 			lon: -97.7466,
 			timezone: "America/Chicago",
 			timezone_offset: -21600,
 			current: 
 			 {
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
			}

			forecast = Forecast.new(data)
			# test = ForecastSerializer.serialize_forecast(forecast)
			test = ForecastSerializer.new(forecast)
			require 'pry'; binding.pry
	end
end