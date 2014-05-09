class UsersController < ApplicationController
	expose(:user)

	def create
		user = User.create(user_params)
		if user.save
			session[:user_id] = user.id
			render action: 'index'
		else
			render action: 'new'
		end
	end

	def index
		require_login
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end

	def require_login
		if !session[:user_id]
			redirect_to logins_path, notice: "Musisz być zalogowany !!"
		else
			@user_id = session[:user_id]
		end
	end
end
