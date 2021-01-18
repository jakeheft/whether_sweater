class Api::V1::ForecastsController < ApplicationController
	def show
		if params[:location] == ''
			render json: ErrorSerializer.empty_query
		else
			stuff = ForecastsFacade.get_forecasts(params[:location])
		end
	end
end