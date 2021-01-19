class Api::V1::UsersController < ApplicationController
	def create
		new_user = User.new(
			email: params[:user][:email],
			password: params[:user][:password],
			api_key: SecureRandom.uuid
		)
		if params[:user][:password] != params[:user][:password_confirmation]
			render json: ErrorSerializer.passwords_dont_match, status: :forbidden
		elsif User.where(email: params[:user][:email]) != []
			render json: ErrorSerializer.duplicate_email, status: :conflict
		elsif params[:user][:email] == nil
			render json: ErrorSerializer.no_email, status: :forbidden
		else
			new_user.save
			render json: UsersSerializer.new(new_user), status: :created
		end
	end
end