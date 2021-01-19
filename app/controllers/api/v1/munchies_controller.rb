class Api::V1::MunchiesController < ApplicationController
	def show
		DirectionsFacade.get_destination_info(params[:start], params[:end])
	end
end