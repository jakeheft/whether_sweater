class Api::V1::RoadTripsController < ApplicationController
	def create
		road_trip = RoadTripsFacade.create_trip(params[:road_trip][:origin], params[:road_trip][:destination], params[:road_trip][:api_key]) ### remove api_key from arguments?
	end
end