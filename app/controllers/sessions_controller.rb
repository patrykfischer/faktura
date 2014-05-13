class SessionsController < ApplicationController
  expose(:user, attributes: :user_params)

  def create
    user = User.find_by(username: user_params[:username])
    #binding.pry
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Zalogowany"
    else
      flash.now[:alert] = "Błędne hasło bądź nazwa użytkownika"
      render action: 'new'
      #binding.pry
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Wylogowano poprawnie'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
