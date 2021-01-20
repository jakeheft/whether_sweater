class Api::V1::RoadTripsController < ApplicationController
	def create
		user = User.find_by(api_key: params[:api_key])
		if user == nil
			render json: ErrorSerializer.invalid_api_key, status: :unauthorized
		else
			road_trip = RoadTripsFacade.create_trip(params[:road_trip][:origin], params[:road_trip][:destination])
			render json: RoadTripsSerializer.new(road_trip)
		end
	end
end