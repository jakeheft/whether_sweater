class Api::V1::UsersController < ApplicationController
	def create
		if params[:password] != params[:password_confirmation]
			render json: ErrorSerializer.passwords_dont_match, status: :forbidden
			elsif User.where(email: params[:email]) != []
				render json: ErrorSerializer.duplicate_email, status: :conflict
		elsif params[:email] == nil
			render json: ErrorSerializer.no_email, status: :forbidden
		else
			new_user = User.create(
				email: params[:email],
				password: params[:password],
				api_key: SecureRandom.uuid)
			render json: UsersSerializer.new(new_user), status: :created
		end
	end
end