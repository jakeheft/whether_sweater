class Api::V1::MunchiesController < ApplicationController
	def show
		MunchiesFacade.get_munchies(params[:start], params[:end])
	end
end