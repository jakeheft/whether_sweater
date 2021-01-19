class Api::V1::UsersController < ApplicationController
	def create
		new_user = User.new(
			email: params[:user][:email],
			password: params[:user][:password],
			api_key: SecureRandom.uuid
		)
		new_user.save
		render json: UsersSerializer.new(new_user), status: :created
	end
end