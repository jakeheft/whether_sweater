class Api::V1::SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:user][:email])
		session[:email] = user.email
		render json: UsersSerializer.new(user)
	end
end