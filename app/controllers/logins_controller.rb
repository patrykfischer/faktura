class LoginsController < ApplicationController
  expose(:user)

  def create
    user = User.where(user_params).first
    #binding.pry
    if user && user.authenticate(params['/logins']['password'])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Zalogowany"
    else
      flash.now[:alert] = "Błędne hasło bądź nazwa użytkownika"
      render action: 'index'
      #binding.pry
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to logins_path, notice: 'Wylogowano poprawnie'
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
