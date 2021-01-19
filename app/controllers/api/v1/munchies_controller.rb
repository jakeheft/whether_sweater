class Api::V1::MunchiesController < ApplicationController
	def show
		munchie = MunchiesFacade.get_munchies(params[:start], params[:end], params[:food])
		render json: MunchiesSerializer.new(munchie)
	end
end