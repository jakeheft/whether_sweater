class Api::V1::ForecastsController < ApplicationController
	def show
		if params[:location] == ''
			render json: ErrorSerializer.empty_query
		else
			forecast = ForecastsFacade.get_forecasts(params[:location])
			if forecast.class == Forecast
				render json: ForecastSerializer.new(forecast)
			else
				render json: ErrorSerializer.invalid_location(forecast)
			end
		end
	end
end