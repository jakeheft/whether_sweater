class Api::V1::SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:email] = user.email
			render json: UsersSerializer.new(user)
		else
			render json: ErrorSerializer.invalid_credentials, status: :unauthorized
		end
	end
end