class UsersController < ApplicationController
	expose(:user, attributes: :user_params)

	before_filter :require_login, only: [:index]

	def create
		if user.save
			session[:user_id] = user.id
			render action: 'index'
		else
			render action: 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end
