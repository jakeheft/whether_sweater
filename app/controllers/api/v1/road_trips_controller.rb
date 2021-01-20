class Api::V1::RoadTripsController < ApplicationController
	def create
		user = User.find_by(api_key: params[:api_key])
		if user == nil
			render json: ErrorSerializer.invalid_api_key, status: :unauthorized
		elsif missing_location?
			render json: ErrorSerializer.empty_query, status: 400
		else
			road_trip = RoadTripsFacade.create_trip(params[:road_trip][:origin], params[:road_trip][:destination])
			if road_trip.class == String
				render json: ErrorSerializer.invalid_location(road_trip), status: 400
			else
				render json: RoadTripsSerializer.new(road_trip)
			end
		end
	end

	def missing_location?
		params[:origin] == '' || params[:origin] == nil || params[:destination] == '' || params[:destination] == nil
	end
end