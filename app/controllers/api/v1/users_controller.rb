class Api::V1::UsersController < ApplicationController
	def create
		# require 'pry'; binding.pry
		new_user = User.new(
			email: params[:user][:email],
			password: params[:user][:password],
			api_key: SecureRandom.uuid
		)
		if User.where(email: params[:user][:email])
			render json: ErrorSerializer.duplicate_email, status: :conflict
		else
			new_user.save
			render json: UsersSerializer.new(new_user), status: :created
		end
	end
end