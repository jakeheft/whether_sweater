require 'rails_helper'

describe 'Weather API' do
	it 'can get weather for a city' do
		get '/api/v1/forecast?location=denver,co'

		expect(response).to be_successful
		
		forecast = JSON.parse(response.body, symbolize_names: true)
		
		expect(forecast).to be_a(Hash)
		expect(forecast).to have_key(:data)
		expect(forecast[:data]).to be_a(Hash)
		expect(forecast[:data]).to have_key(:id)
		expect(forecast[:data][:id]).to eq(nil)
		expect(forecast[:data]).to have_key(:type)
		expect(forecast[:data][:type]).to eq('forecast')
		expect(forecast[:data]).to have_key(:attributes)
		expect(forecast[:data][:attributes]).to be_a(Hash)
		expect(forecast[:data][:attributes]).to have_key(:current_weather)
		expect(forecast[:data][:attributes]).to have_key(:daily_weather)
		expect(forecast[:data][:attributes]).to have_key(:hourly_weather)

		current = forecast[:data][:attributes][:current_weather]
		daily = forecast[:data][:attributes][:daily_weather]
		hourly = forecast[:data][:attributes][:hourly_weather]

		expect(current).to be_a(Hash)
		expect(current).to have_key(:date_time)
		expect(current[:date_time]).to be_a(String)
		expect(current).to have_key(:sunrise)
		expect(current[:sunrise]).to be_a(String)
		expect(current).to have_key(:sunset)
		expect(current[:sunset]).to be_a(String)
		expect(current).to have_key(:temp)
		expect(current[:temp]).to be_an(Float)
		expect(current).to have_key(:feels_like)
		expect(current[:feels_like]).to be_an(Float)
		expect(current).to have_key(:humidity)
		expect(current[:humidity]).to be_an(Integer).or be_a(Float)
		expect(current).to have_key(:uvi)
		expect(current[:uvi]).to be_an(Integer).or be_a(Float)
		expect(current).to have_key(:visibility)
		expect(current[:visibility]).to be_an(Integer).or be_a(Float)
		expect(current).to have_key(:conditions)
		expect(current[:conditions]).to be_a(String)
		expect(current).to have_key(:icon)
		expect(current[:icon]).to be_a(String)
		expect(current).to_not have_key(:dt)
		expect(current).to_not have_key(:dew_point)
		expect(current).to_not have_key(:clouds)
		expect(current).to_not have_key(:wind_speed)
		expect(current).to_not have_key(:wind_deg)
		expect(current).to_not have_key(:weather)

		
		expect(daily).to be_a(Array)
		expect(daily.count).to eq(5)

		day = daily.first

		expect(day).to be_a(Hash)
		expect(day).to have_key(:date)
		expect(day[:date]).to be_a(String)
		expect(day).to have_key(:sunrise)
		expect(day[:sunrise]).to be_a(String)
		expect(day).to have_key(:sunset)
		expect(day[:sunset]).to be_a(String)
		expect(day).to have_key(:max_temp)
		expect(day[:max_temp]).to be_an(Float)
		expect(day).to have_key(:min_temp)
		expect(day[:min_temp]).to be_an(Float)
		expect(day).to have_key(:conditions)
		expect(day[:conditions]).to be_a(String)
		expect(day).to have_key(:icon)
		expect(day[:icon]).to be_a(String)
		expect(day).to_not have_key(:dt)
		expect(day).to_not have_key(:pressure)
		expect(day).to_not have_key(:dew_point)
		expect(day).to_not have_key(:wind_speed)
		expect(day).to_not have_key(:wind_deg)
		expect(day).to_not have_key(:weather)
		expect(day).to_not have_key(:clouds)
		expect(day).to_not have_key(:pop)
		expect(day).to_not have_key(:rain)


		expect(hourly).to be_a(Array)
		expect(hourly.count).to eq(8)

		hour = hourly.first

		expect(hour).to be_a(Hash)
		expect(hour).to have_key(:time)
		expect(hour[:time]).to be_a(String)
		expect(hour).to have_key(:temp)
		expect(hour[:temp]).to be_an(Float)
		expect(hour).to have_key(:wind_speed)
		expect(hour[:wind_speed]).to be_a(String)
		expect(hour).to have_key(:wind_direction)
		expect(hour[:wind_direction]).to be_a(String)
		expect(hour).to have_key(:conditions)
		expect(hour[:conditions]).to be_a(String)
		expect(hour).to have_key(:icon)
		expect(hour[:icon]).to be_a(String)
		expect(hour).to_not have_key(:dt)
		expect(hour).to_not have_key(:feels_like)
		expect(hour).to_not have_key(:pressure)
		expect(hour).to_not have_key(:humidity)
		expect(hour).to_not have_key(:dew_point)
		expect(hour).to_not have_key(:uvi)
		expect(hour).to_not have_key(:clouds)
		expect(hour).to_not have_key(:visibility)
		expect(hour).to_not have_key(:wind_deg)
		expect(hour).to_not have_key(:weather)
		expect(hour).to_not have_key(:pop)
	end

	it 'will give an error message if problem' do
		get '/api/v1/forecast?location='

		expect(response).to be_successful
		
		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data).to be_a(Hash)
		expect(error_data).to have_key(:data)
		expect(error_data[:data]).to be_a(Hash)
		expect(error_data[:data]).to have_key(:id)
		expect(error_data[:data][:id]).to eq(nil)
		expect(error_data[:data]).to have_key(:type)
		expect(error_data[:data][:type]).to be_a(String)
		expect(error_data[:data]).to have_key(:message)
		expect(error_data[:data][:message]).to eq('no location query entered')

		get '/api/v1/forecast?location= '

		expect(response).to be_successful
		
		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data).to be_a(Hash)
		expect(error_data).to have_key(:data)
		expect(error_data[:data]).to be_a(Hash)
		expect(error_data[:data]).to have_key(:id)
		expect(error_data[:data][:id]).to eq(nil)
		expect(error_data[:data]).to have_key(:type)
		expect(error_data[:data][:type]).to be_a(String)
		expect(error_data[:data]).to have_key(:message)
		expect(error_data[:data][:message]).to eq('invalid location queried')

		get '/api/v1/forecast?location=york'

		expect(response).to be_successful
		
		error_data = JSON.parse(response.body, symbolize_names: true)

		expect(error_data).to be_a(Hash)
		expect(error_data).to have_key(:data)
		expect(error_data[:data]).to be_a(Hash)
		expect(error_data[:data]).to have_key(:id)
		expect(error_data[:data][:id]).to eq(nil)
		expect(error_data[:data]).to have_key(:type)
		expect(error_data[:data][:type]).to be_a(String)
		expect(error_data[:data]).to have_key(:message)
		expect(error_data[:data][:message]).to eq('ambiguous results, please refine query')
	end
end