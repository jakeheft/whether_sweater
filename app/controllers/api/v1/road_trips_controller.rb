class Api::V1::RoadTripsController < ApplicationController
	def create
		road_trip = RoadTripsFacade.create_trip(params[:road_trip][:origin], params[:road_trip][:destination])
		render json: RoadTripsSerializer.new(road_trip)
	end
end