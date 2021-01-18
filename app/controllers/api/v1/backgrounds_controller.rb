class Api::V1::BackgroundsController < ApplicationController
	def show
		image = ImagesFacade.get_image(params[:location])
		render json: ImagesSerializer.new(image)
	end
end